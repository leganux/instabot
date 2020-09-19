LAST_COMMIT_MESSAGE="$(git log --no-merges -2 --pretty=%B)"
git config --global user.email "don@obeyi.com"
git config --global user.name "don Pablo"
git tag -a "${COMMIT_MESSAGE}" -m "${LAST_COMMIT_MESSAGE}" -m "[ci skip]"
git remote remove origin
git remote add origin https://${GITHUB_TOKEN}@github.com/donPabloNow/instabot.git
git push origin --tags HEAD:master


# build and push to PYPI
python setup.py sdist
pip install twine
twine upload -u $PYPI_USERNAME -p $PYPI_PASSWORD dist/*
