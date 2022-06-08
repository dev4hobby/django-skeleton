from django.db import models

class User(models.Model):
    """
    User info
    """

    name = models.CharField(max_length=100)
    age = models.IntegerField()
    

    class Meta:
        ordering = ("-age",)
        verbose_name = "User"
        verbose_name_plural = "Users"

    def __str__(self):
        return self.name