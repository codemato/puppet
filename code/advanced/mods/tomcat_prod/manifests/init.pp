class tomcat_prod {
  class { 'java':
    distribution => 'jre',
  }

  tomcat::install { '/opt/tomcat':
    source_url => 'https://www.apache.org/dist/tomcat/tomcat-8/v8.0.44/bin/apache-tomcat-8.0.44.tar.gz'

  }

  tomcat::instance { 'default':
    catalina_home => '/opt/tomcat',
  }
}
