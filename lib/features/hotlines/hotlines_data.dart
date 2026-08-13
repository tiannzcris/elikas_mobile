/// Static reference data -- there's no hotlines table in the backend
/// (confirmed: not in the migrations), so per the implementation plan's
/// gap #4, this is hardcoded rather than faking an API call for it.
///
/// TODO(project owner): replace every phoneNumber below with the real
/// number and flip isPlaceholder to false for that entry. Left as an
/// obvious placeholder ("0000-000-0000") on purpose -- a resident must
/// never be able to mistake a made-up number for a real emergency line.
class Hotline {
  final String category;
  final String name;
  final String description;
  final String phoneNumber;
  final bool isPlaceholder;

  const Hotline({
    required this.category,
    required this.name,
    required this.description,
    required this.phoneNumber,
    this.isPlaceholder = true,
  });
}

const List<Hotline> hotlines = [
  Hotline(
    category: 'Social Welfare',
    name: 'CSWDO Ligao City',
    description: 'City Social Welfare and Development Office',
    phoneNumber: '0000-000-0000',
  ),
  Hotline(
    category: 'Emergency Response',
    name: 'MDRRMO Ligao',
    description: 'City Disaster Risk Reduction and Management Office',
    phoneNumber: '0000-000-0000',
  ),
  Hotline(
    category: 'Medical',
    name: 'Philippine Red Cross',
    description: 'Ligao City Chapter',
    phoneNumber: '0000-000-0000',
  ),
  Hotline(
    category: 'Police',
    name: 'PNP Ligao City',
    description: 'Philippine National Police',
    phoneNumber: '0000-000-0000',
  ),
  Hotline(
    category: 'Fire',
    name: 'BFP Ligao City',
    description: 'Bureau of Fire Protection',
    phoneNumber: '0000-000-0000',
  ),
  Hotline(
    category: 'Health',
    name: 'City Health Office',
    description: 'Ligao City Health Department',
    phoneNumber: '0000-000-0000',
  ),
];
