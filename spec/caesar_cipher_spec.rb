# spec/caesar_cipher_spec.rb
require_relative '../lib/caesar_cipher'

RSpec.describe CaesarCipher do
  # Bu, CaesarCipher sınıfını test etmek için tanımlanan bir describe bloğudur.
  let(:cipher) { CaesarCipher.new(7) } # Bu, 7 kaydırmalı CaesarCipher nesnesini oluşturur.

  # encode (şifreleme) işlemini test etmek için describe bloğu.
  describe '#encode' do
    # Küçük harflerin doğru şekilde şifrelenip şifrelenmediğini test eder.
    it 'encodes lowercase letters correctly' do
      expect(cipher.encode('abc')).to eq('hij')
    end

    # Büyük harflerin doğru şekilde şifrelenip şifrelenmediğini test eder.
    it 'encodes uppercase letters correctly' do
      expect(cipher.encode('ABC')).to eq('HIJ')
    end

    # Alfabetik olmayan karakterlerin değişmeden kalıp kalmadığını kontrol eder.
    it 'handles non-alphabetical characters' do
      expect(cipher.encode('123!@#')).to eq('123!@#')
    end
  end

  # decode (şifre çözme) işlemini test etmek için describe bloğu.
  describe '#decode' do
    # Küçük harflerin doğru şekilde şifre çözüldüğünü test eder.
    it 'decodes lowercase letters correctly' do
      expect(cipher.decode('hij')).to eq('abc')
    end

    # Büyük harflerin doğru şekilde şifre çözüldüğünü test eder.
    it 'decodes uppercase letters correctly' do
      expect(cipher.decode('HIJ')).to eq('ABC')
    end

    # Alfabetik olmayan karakterlerin değişmeden kaldığını kontrol eder.
    it 'handles non-alphabetical characters' do
      expect(cipher.decode('123!@#')).to eq('123!@#')
    end
  end
end

