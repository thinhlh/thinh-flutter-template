enum AppPreferenceKey {
  resetDB('resetDB'),
  localTimeZone('localTimeZone'),
  language('language'),
  theme('theme'),
  darkOption('darkOption'),
  font('font'),
  reportPeriod('reportPeriod'),
  reportItems('reportItems'),
  rememberUser('remeberUser'),
  accessToken('accessToken');

  final String value;
  const AppPreferenceKey(this.value);
}
