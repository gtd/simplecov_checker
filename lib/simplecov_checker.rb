require "simplecov_checker/version"
require 'json'
require 'set'

class SimpleCovChecker
  attr_reader :resultset_path, :source_path

  def initialize(options = {})
    @source_path = options.delete(:source_path) || 'app'
    @resultset_path = options.delete(:resultset_path) || 'coverage'

    raise ArgumentError, "Unexpected options: #{options.keys}" unless options.empty?
  end

  def missed_files
    uncovered_files source_path
  end

  private

  def covered_files
    @covered_files ||= resultset.inject(Set.new) do |files, (key, val)|
      files += val['coverage'].keys.map{ |file| file.gsub(Dir.pwd + '/', '') }
      files
    end
  end

  def uncovered_files(path)
    if File.file?(path) &&
       File.extname(path) == '.rb' &&
       !covered_files.include?(path)
      path
    elsif File.directory?(path)
      Dir["#{path}/*"].map do |subpath|
        uncovered_files(subpath)
      end.flatten.compact
    end
  end

  def resultset
    JSON.parse File.read(File.join(resultset_path, '.resultset.json'))
  end
end
