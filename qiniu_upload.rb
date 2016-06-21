#!/usr/bin/env ruby

require File.expand_path("../qiniu_upload/env", __FILE__)
require File.expand_path("../qiniu_upload/qiniu_init", __FILE__)
require File.expand_path("../qiniu_upload/file", __FILE__)
require File.expand_path("../qiniu_upload/dir", __FILE__)

require 'commander/import'
program :name, 'qiniu_upload'
program :version, '0.0.1'
program :description, '上传文件到七牛'

command :file do |c|
  c.syntax = 'qiniu_upload file local_file qiniu_save_path'
  c.summary = ''
  c.description = ''
  c.example '上传单个文件到七牛', 'qiniu_upload file local.tar.gz qiniu_base_path/local.tar.gz'
  c.action do |args|
    local_path = File.expand_path(args[0], Dir.pwd)
    qiniu_path = args[1]
    QiniuUpload::File.new(local_path, qiniu_path).upload
  end
end

command :dir do |c|
  c.syntax = 'qiniu_upload dir local_dir qiniu_save_dir'
  c.summary = ''
  c.description = ''
  c.example '上传目录到七牛', 'qiniu_upload dir local_dir qiniu_dir'
  c.action do |args|
    local_dir = File.expand_path(args[0], Dir.pwd)
    qiniu_dir = args[1]
    QiniuUpload::Dir.new(local_dir, qiniu_dir).upload
  end
end
