class Item < ApplicationRecord
  extend FriendlyId
  friendly_id :item_code, use: :slugged

  mount_uploader :qrcode, QrCodeUploader

  has_many :orders
  has_many :members, through: :orders

  validates :name, presence: true
  validates :category, presence: true

  before_create :generate_qr_code

  private
  def generate_qr_code
    require 'rqrcode'

    qrcode = RQRCode::QRCode.new("#{self.slug} | #{self.lot_no}")

    # NOTE: showing with default options specified explicitly
    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black',
      file: nil,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 240
    )
    file = File.open("/tmp/#{self.slug}.png", 'wb')
    file.write(png.to_s)
    self.qrcode = file
    # self.save
  end
end
