# The keepass project is hosted on SourceForge so we need to follow
# web redirections in order to download the package.
class WgetDownloadStrategy < CurlDownloadStrategy
  def _fetch
    system "wget", @url, "-O", temporary_path
  end
end

class Keepass < Formula
  desc " KeePass is a free open source password manager, which helps you to manage your passwords in a secure way.
   You can put all your passwords in one database, which is locked with one master key or a key file. 
   So you only have to remember one single master password or select the key file to unlock the whole database. 
   The databases are encrypted using the best and most secure encryption algorithms currently known (AES and Twofish). 
   For more information, see the features page."
  homepage "http://keepass.info/"
  version "2.35"

  url "https://downloads.sourceforge.net/project/keepass/KeePass%202.x/#{version}/KeePass-#{version}.zip",
   :using => WgetDownloadStrategy
  sha256 "5ce675e9b3949a9c0d269233d52602c563c4fd6a4d047db517aa06bf326ce133"

  # Do not create any symlink in the bin folder, the project is supposed
  # to be run under the mono framework.
  def install
    libexec.install Dir["*"]
  end
end
