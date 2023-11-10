if [ "$#" -lt "1" ]; then
echo "Must specify user"
exit;
fi

USER=$@

#for user in file

for user in $(cat file); do

HOMEDIR=$(egrep ^${user} /etc/passwd | cut -d: -f6)

if [ ! -f /var/cpanel/users/$user ]; then
echo "$user user file missing, likely an invalid user"

else

echo "Copy files from user $user"

\cp -r /backup/incremental/accounts/$user/homedir/www/index* /home/$user/www/  && chown -R  $user.$user /home/$user/www/*

fi
done
