from app.settings import *

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.mysql",
        "NAME": "db",
        "USER": "username",
        "PASSWORD": "password",
        "HOST": "mysql",
        "PORT": "3306",
        "OPTIONS": {
            "init_command": "SET sql_mode='STRICT_TRANS_TABLES'; SET foreign_key_checks = 0;",
            "charset": "utf8mb4",
            "use_unicode": True,
        },
    }
}
