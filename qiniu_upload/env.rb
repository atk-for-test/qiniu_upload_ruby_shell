require 'yaml'

yml_file = File.expand_path("../../env.yml", __FILE__)
if !File.exists?(yml_file)
  p "env.yml 文件不存在，请参考 env.yml.example 创建"
end

QINIU_UPLOAD_ENV = YAML.load_file yml_file
