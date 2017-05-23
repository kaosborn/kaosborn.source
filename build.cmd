@rem 1. Scaffold a new blog from project root:
@rem      wyam.exe new --recipe Blog
@rem 2. Create repository at github and clone:
@rem      git clone https://github.com/kaosborn/kaosborn.github.io.git
@rem 3. Execute this script:
@rem      build
@rem 4. If all is good, then publish:
@rem      git commit -m built
@rem      git push -u origin master
pushd kaosborn.github.io
git rm -rfq .
popd
wyam.exe --recipe Blog --theme CleanBlog --output kaosborn.github.io --noclean
pushd kaosborn.github.io
git add *
git add .nojekyll
popd
