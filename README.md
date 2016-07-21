# PokemonGo-Map-Docker

This is a Dockerfile for PokemonGo-Map https://github.com/AHAAAAAAA/PokemonGo-Map

Expample:
`docker run -e pokemon_Username=john@doe.com -e pokemon_Location=51.582163,6.2668583 -e pokemon_Password=FooBar123! -e pokemon_AuthType=google -e pokemon_StepLimit=10 -e pokemon_Gmapskey=GoogleMapsAPIKEY -p 8080:5000 pikespeak/pokemongo-map-docker
`