#!/usr/bin/ruby
# -*- encoding: utf-8 -*-

"あいうえお".scan(/./u) do |c|
	puts c
end

p "スイフト" < "スウィフト"


sjis_luggnagg = "\203\211\203\117\203\151\203\117"
euc_lugnagg = "\245\351\245\260\245\312\245\260"
p sjis_luggnagg <=> euc_lugnagg


p "あいう".encoding
p "あいう".length
p "あいう".bytesize

#p Encoding.name_list
p Encoding.find("CP1258")

p "将軍".encoding
p "shogunate".encoding

utf = "日本"
p utf.encoding
sjis = utf.encode("Shift_JIS")
p sjis.encoding


utf = "\x83\x89\x83\x4f\x83\x69\x83\x4f"
sjis = "\x83\x89\x83\x4f\x83\x69\x83\x4f".force_encoding("Shift_JIS")
p utf.encoding
p sjis.encoding

#sjis = "ラグナグ".encode("Shift_JIS")
#euc = "への旅".encode("EUC-JP")
#p sjis + euc

sjis = "ラグナグ".encode("Shift_JIS")
utf = "voyage to ".force_encoding("UTF-8")
p utf + sjis

sjis = "\xc2\xa1".force_encoding("Shift_JIS")
euc = "\xc2\xa1".force_encoding("EUC-JP")
p sjis.bytes.to_a
p euc.bytes.to_a
p sjis == euc