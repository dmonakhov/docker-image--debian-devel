#! groovy

// Local Variables:
// mode: groovy
// comment-column: 0
// End:

def registry = 'autotest.qa.sw.ru:5000';
def image_name = 'debian-devel';
def full_name = registry + '/' + image_name;
// In order to avoid chick and egg problem  let's do nod use docker container here
node () {
    stage ('Build image') {
	deleteDir();
	checkout scm;
	def img = docker.build(full_name + ':${BUILD_TAG}');
    }
    stage ('Push image to registry') {
	docker.image(full_name + ':${BUILD_TAG}').push('latest')
    }
}
