class Task < ApplicationRecord
    mount_uploader :file, FileUploader
end
