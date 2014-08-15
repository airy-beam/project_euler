class String
  def delete_at(index)
    t = self.scan(/./)
    t.delete_at(index)
    t.join    
  end
end
