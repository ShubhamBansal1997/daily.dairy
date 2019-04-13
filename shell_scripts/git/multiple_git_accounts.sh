#! /bin/bash
# The problem here is about using multiple git accounts from the same account

# - Work  (shubhm@innov8.work) and the gpg
# - Personal (shubhambansal17@hotmail.com) and the gpg
# - other (shubham@getchip.uk) and the gpg

# Write a shell script to pass the work object and the project now set stuff up as the work email and alias

work_email="shubhm@innov8.work";
personal_email="shubhambansal17@hotmail.com";
freelance_email="shubham@getchip.uk"
work_gpg="24C30B2DD4F29EBC";
personal_gpg="9943FC17E495BB67";
freelance_gpg="B4B7BE56FE624B8E";
name="Shubham Bansal";
work_commit_template="~/.work-template";
personal_commit_template="~/.personal-template";
freelance_commit_template="~/.freelance-template";

echo "Hello Sir, Do you want to setup git for work for for fun?";
read -p "Enter choices (work/personal/freelance): " choice

echo "\n";
echo $choice;
echo "\n";

SetForWork() {
  git config user.name $name;
  git config user.email $work_email;
  git config commit.gpgsign true;
  git config user.signingkey $work_gpg;
  git config commit.template $work_commit_template;
}

SetForFun() {
  git config user.name $name;
  git config user.email $personal_email;
  git config commit.gpgsign true;
  git config user.signingkey $personal_gpg;
  git config commit.template $personal_commit_template;
}

SetForFreelance() {
  git config user.name $name;
  git config user.email $freelance_email;
  git config commit.gpgsign true;
  git config user.signingkey $freelance_gpg;
  git config commit.template $freelance_commit_template;
}
if [ "$choice" == "work" ]
then
   echo "Setting up git for work"
   SetForWork
fi

if [ "$choice" == "personal" ]
then
  echo "Setting up Git for personal usage";
  SetForFun
fi

if [ "$choice" == "freelance" ]
then
  echo "Setting up Git for freelance usage";
  SetForFreelance
fi
