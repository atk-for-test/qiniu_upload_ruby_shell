require 'qiniu'
Qiniu.establish_connection! :access_key => QINIU_UPLOAD_ENV["qiniu_app_access_key"],
                            :secret_key => QINIU_UPLOAD_ENV["qiniu_app_secret_key"]
