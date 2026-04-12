# 🔑 Security Hardening

## 📄📄📄 QUIZ

A. Web server
Do security hardening for Nginx. Our goals is :
1. Nginx doesn't respond with indexing when there isn't any index.html/index.php file
2. Outsiders cannot access .git folder
3. Nginx is not running as root user
4. Server response header is not nginx
Do security hardening for PHP. Our goals is :
5. PHP cannot run exec() function
6. PHP-FPM is not running as root user

## 📄📄📄 Answer

1. Disable Directory Indexing

Configure Nginx to prevent directory listing when no index file exists.
``` bash 
autoindex off;
```

2. Restrict Access to Sensitive Files
Block external access to hidden files and directories, especially .git.

``` bash
location ~ /\.git {
    deny all;
    return 403;
}
```
3. Run Nginx as Non-Root User
Ensure worker processes run under a limited-privilege user (e.g., www-data or nginx). Edit `/etc/nginx/nginx.conf` file.
```bash
user www-data;
```

4. Hide Server Information
Remove or obfuscate the Server response header to avoid exposing Nginx details. Remove this `flag` file.
```bash
add_header Server "SecureServer"; 
```

5. Disable Dangerous Functions
Prevent execution of system-level commands by disabling functions like exec().
Dicabuluan disable_functions = exec
disable 

``` bash
disable_functions = exec
```

6. Run PHP-FPM as Non-Root User
Configure PHP-FPM pools to run under a restricted user account.
Edit pool config `(e.g., /etc/php/*/fpm/pool.d/www.conf)` to be :
```bash 
user = www-data
group = www-data

```

