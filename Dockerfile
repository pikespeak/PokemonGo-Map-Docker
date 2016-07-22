# Dockerizing PokemonGo-Map: Dockerfile for building PokemonGo Map
# Based on ubuntu:latest, installs PokemonGo-Map following the instructions from:
# https://github.com/AHAAAAAAA/PokemonGo-Map/wiki/Installation-and-requirements

FROM ubuntu:latest
MAINTAINER Oliver Mark olivermark83@gmail.com

# Install Ubuntu Upgrades and required Software
RUN apt-get update && apt-get install -y \
  git \
  python \
  python-pip

# Upgrade Python Installer PIP
RUN pip install --upgrade pip

#Working Directory For App
WORKDIR /home/PokemonGo-Map

# Clone Develop Branche of PokemonGo-Map from Github
RUN git clone https://github.com/AHAAAAAAA/PokemonGo-Map -b develop /home/PokemonGo-Map

# Install PokemanGo-Map Requirements 
RUN pip install --upgrade -r /home/PokemonGo-Map/requirements.txt

# This command is run while Starting Docker Container
CMD python /home/PokemonGo-Map/runserver.py \
	-a $pokemon_AuthType \
	-u $pokemon_Username \
	-p $pokemon_Password \
	-l $pokemon_Location \
	-s $pokemon_StepLimit \
	-k $pokemon_Gmapskey \
	-H 0.0.0.0 \
	-L DE \
	-sd 360

