if ! echo $PATH | grep -q /usr/pgsql-9.6/bin ; then
  export PATH=$PATH:/usr/pgsql-9.6/bin
fi
