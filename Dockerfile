FROM node:12

ARG WORKDIR=/JenkinsCodebuildTutorial

COPY . ${WORKDIR}
WORKDIR ${WORKDIR}

RUN yarn
RUN yarn start

RUN chmod +x ci/entrypoint.sh
ENTRYPOINT [ "ci/entrypoint.sh" ]
CMD ["yarn", "start:prod"]
