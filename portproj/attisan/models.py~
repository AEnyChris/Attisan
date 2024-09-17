"""
All the models are defined here
"""

from django.db import models
from django.utils import timezone
# Create your models here.


class Base(models.Model):
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True


class State(Base):
    """Defines the State object"""
    name = models.CharField(max_length=50)

    def __str__(self):
        return f"State {self.id}: {self.name}"


class City(Base):
    """Defines the City object"""
    name = models.CharField(max_length=64)
    state = models.ForeignKey(State,
                              on_delete=models.CASCADE,
                              related_name="cities")

    def __str__(self):
        return f"{self.name}, {self.state.name}"


class Client(Base):
    """Defines the Client object"""
    first_name = models.CharField(max_length=64)
    last_name = models.CharField(max_length=64)
    username = models.CharField(max_length=64)
    password = models.CharField(max_length=16)
    email = models.EmailField()
    city = models.ForeignKey(City,
                             on_delete=models.CASCADE,
                             related_name="clients")

    def __str__(self):
        return f"Client {self.id}: {self.first_name} {self.last_name}"


class Project(Base):
    """Defines the Project object"""
    title = models.CharField(max_length=64)
    description = models.CharField(max_length=2048, blank=True, null=True)
    image_url = models.CharField(max_length=64, blank=True, null=True)

    def __str__(self):
        return "{} {}: {} of {}".format(self.__class__.__name__,
                                        self.id,
                                        self.title,
                                        self.artisan.first_name,
                                        self.artisan.last_name)


class Artisan(Base):
    """Defines the Artisan object"""
    first_name = models.CharField(max_length=64)
    last_name = models.CharField(max_length=64)
    username = models.CharField(max_length=64)
    title = models.CharField(max_length=64, blank=True, null=True)
    password = models.CharField(max_length=16)
    email = models.EmailField()
    bio = models.CharField(max_length=1024, blank=True, null=True)
    ratings = models.ManyToManyField(Client, through="Ratings")
    city = models.ForeignKey(City,
                             on_delete=models.CASCADE,
                             related_name="artisans")
    projects = models.ForeignKey(Project,
                                 on_delete=models.CASCADE,
                                 related_name="artisan")

    def __str__(self):
        return "{} {}: {} {} {}".format(self.__class__.__name__,
                                         self.id,
                                         self.first_name,
                                         self.last_name,
                                         self.title)


class Ratings(Base):
    """Defines the Rating object"""
    rating = models.IntegerField()
    review = models.CharField(max_length=2048, blank=True, null=True)
    artisan = models.ForeignKey(Artisan,
                                on_delete=models.CASCADE,
                                related_name="cli_reviews")
    client = models.ForeignKey(Client,
                               on_delete=models.CASCADE,
                               related_name="art_reviews")

    def __str__(self):
        return "{} {} of {} by {} {}".format(self.__class__.__name__,
                                             self.id,
                                             self.artisan.username,
                                             self.client.first_name,
                                             self.client.last_name)
