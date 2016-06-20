include:
  - java

sonarqube:
  pkg.installed:
    - name: sonar
    - require:
      - pkgrepo: sonar

sonarqube-repo:
  pkgrepo.managed:
    - name: sonar
    - humanname: Sonar
    - baseurl: http://downloads.sourceforge.net/project/sonar-pkg/rpm
    - gpgcheck: 0
