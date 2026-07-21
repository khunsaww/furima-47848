class Prefecture < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [{ id: 0, name: '---' }] + JpPrefecture::Prefecture.all.map { |p| { id: p.code, name: p.name } }
end
