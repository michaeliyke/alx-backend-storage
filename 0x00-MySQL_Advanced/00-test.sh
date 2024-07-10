#!/usr/bin/env bash
# Execute a test select command against the mysql database
echo "SELECT * FROM tv_genres" | mysql -uroot -p hbtn_0d_tvshows

