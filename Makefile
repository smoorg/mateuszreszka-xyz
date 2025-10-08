.PHONY:
all:
	hugo build --config config.gemini.yml
	hugo build --config config.yml
