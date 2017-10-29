@rem 1. Scaffold a new blog from project root:
@rem      wyam.exe new --recipe Blog
@rem 2. Create repository at github and clone:
@rem      git clone https://github.com/kaosborn/kaosborn.github.io.git
@rem 3. Execute this script:
@rem      build
@rem 4. If all is good, then publish content:
@rem      cd kaosborn.github.com
@rem      git commit -m built
@rem      git push -u origin master
@rem 5. And publish the source:
@rem      cd ..
@rem      git add *
@rem      git commit -m whywhywhy
@rem      git push -u origin master
@rem
pushd kaosborn.github.io
git rm -rfq .
popd
wyam.exe --recipe Blog --theme CleanBlog --output kaosborn.github.io --noclean
pushd kaosborn.github.io
git add *
git add .nojekyll
popd
