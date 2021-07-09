class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'トップス' },
    { id: 3, name: 'アウター' },
    { id: 4, name: 'ワンピース' },
    { id: 5, name: 'ボトムス' },
    { id: 6, name: 'シューズ' },
    { id: 7, name: 'バッグ' },
    { id: 8, name: 'アクセサリー' },
    { id: 9, name: 'セットアイテム' }
  ]
 
   include ActiveHash::Associations
   has_many :items
 
end