echo "\nHave you already made your new repo?"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) break;;
    No ) echo "\nPlease make your repo and start again\n"; exit;;
  esac
done

read -p "\nWhat is your repo's address?" REPOADDRESS

# Test that repo is accessible

read -p "\nWhere do you want to check the repo out to?" REPOLOCATION

if [ "$REPOLOCATION" != "" ]; then
  cd $REPOLOCATION
else
  REPOLOCATION=$(pwd)
fi

echo "\n\nDuplicating fb-service-starter to $REPOADDRESS\n\nChecking out code at $REPOLOCATION\n\nIs this correct?"
select confirm in "Yes" "No"; do
  case $confirm in
    Yes ) break;;
    No ) echo "\nStopping\n"; exit 1;;
  esac
done

git clone --bare https://github.com/ministryofjustice/fb-service-starter.git

cd fb-service-starter.git

git push --mirror $REPOADDRESS

cd ..

rm -rf fb-service-starter.git

git clone $REPOADDRESS