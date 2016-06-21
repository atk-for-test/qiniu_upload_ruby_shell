module QiniuUpload
  class File
    def initialize(local_path, qiniu_path)
      @local_path = local_path
      @qiniu_path = qiniu_path
    end

    def upload
      bucket     = QINIU_UPLOAD_ENV["qiniu_bucket"]
      put_policy = Qiniu::Auth::PutPolicy.new(bucket, @qiniu_path, 3600)
      uptoken    = Qiniu::Auth.generate_uptoken(put_policy)

      code, result = Qiniu::Storage.upload_with_token_2(
        uptoken, @local_path, @qiniu_path
      )

      if code == 200
        p "#{@qiniu_path} 上传成功"
      else
        p "#{@qiniu_path} 上传失败"
      end

    end
  end
end
