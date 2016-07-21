# Dockerizing PokemonGo-Map: Dockerfile for building PokemonGo Map
# Based on ubuntu:latest, installs PokemonGo-Map following the instructions from:
# https://github.com/AHAAAAAAA/PokemonGo-Map/wiki/Installation-and-requirements

FROM ubuntu:latest
MAINTAINER Oliver Mark olivermark83@gmail.com

RUN apt-get update && apt-get install -y \
  git \
  nano \
  python \
  python-pip

RUN pip install --upgrade pip

RUN git clone https://github.com/AHAAAAAAA/PokemonGo-Map -b develop /home/Pokemongo-Map

RUN pip install --upgrade -r /home/PokemonGo-Map/requirements.txt

CMD cd /home/PokemonGo-Map && python /home/PokemonGo-Map/runserver.py \
	-a google \
	-u $pokemon_Username \
	-p $pokemon_Password \
	-l $pokemon_Location \
	-s $pokemon_StepLimit \
	-k $pokemon_Gmapskey \
	-H 0.0.0.0

