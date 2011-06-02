require digest

FIPS PUB 180-2に記述されているNIST (the US' National Institute of
Standards and Technology) の以下のアルゴリズムを実装するクラスを提供す
るライブラリです。

  * SHA-256 Secure Hash Algorithm
  * SHA-384 Secure Hash Algorithm
  * SHA-512 Secure Hash Algorithm

= class Digest::SHA256 < Digest::Base

FIPS PUB 180-2に記述されているNIST (the US' National Institute of
Standards and Technology) の SHA-256 Secure Hash Algorithmを
実装するクラスです。


= class Digest::SHA384 < Digest::Base

FIPS PUB 180-2に記述されているNIST (the US' National Institute of
Standards and Technology) の SHA-384 Secure Hash Algorithmを
実装するクラスです。


= class Digest::SHA512 < Digest::Base

FIPS PUB 180-2に記述されているNIST (the US' National Institute of
Standards and Technology) の SHA-512 Secure Hash Algorithmを
実装するクラスです。

#@since 1.8.6
= class Digest::SHA2 < Digest::Class
== Class Methods
--- new(bitlen = 256)
#@todo
Creates a new SHA2 hash object with a given bit length.
#@end
