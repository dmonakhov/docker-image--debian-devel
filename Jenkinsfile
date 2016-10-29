#! groovy

// Local Variables:
// mode: groovy
// comment-column: 0
// End:

def registry = 'autotest.qa.sw.ru:5000';
def image_name = 'debian-devel';
def full_name = registry + '/' + image_name;
def docker_http_proxy = '--build-arg=http_proxy="http://autotest.qa.sw.ru:3128"';
// In order to avoid chick and egg problem  let's do nod use docker container here
node () {
    deleteDir();
    stage 'Build image'
    checkout scm;
    def img = docker.build(full_name + ':${BUILD_TAG}', docker_http_proxy + ' .');
    stage 'Push image to registry'
    img.push('latest')
}
