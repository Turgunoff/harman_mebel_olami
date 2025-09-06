import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../controllers/theme_controller.dart';

class SettingsScreen extends GetView<ThemeController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController());

    return Scaffold(
      appBar: AppBar(title: Text('Sozlamalar'), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sozlamalar bo'limi
            _buildSectionHeader(context, 'Sozlamalar'),
            _buildSettingsSection(context),

            SizedBox(height: 24),

            // Aloqa ma'lumotlari
            _buildSectionHeader(context, 'Biz bilan bog\'laning'),
            _buildContactSection(context),

            SizedBox(height: 24),

            // Manzil
            _buildSectionHeader(context, 'Bizning manzil'),
            _buildAddressSection(context),

            SizedBox(height: 24),

            // Ilova haqida
            _buildSectionHeader(context, 'Ilova haqida'),
            _buildAppInfoSection(context),

            SizedBox(height: 32),

            // Copyright
            _buildCopyright(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Column(
      children: [
        // Dark Mode
        Card(
          child: ListTile(
            leading: Icon(
              Icons.dark_mode,
              color: Theme.of(context).primaryColor,
            ),
            title: Text('Tungi rejim', style: TextStyle(fontFamily: 'Poppins')),
            trailing: Obx(
              () => Switch(
                value: controller.isDarkMode.value,
                onChanged: (value) => controller.toggleTheme(),
                activeColor: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),

        SizedBox(height: 8),

        // Til sozlamalari (keyingi versiya)
        Card(
          child: ListTile(
            leading: Icon(Icons.language, color: Colors.grey[600]),
            title: Text('Til / Язык', style: TextStyle(fontFamily: 'Poppins')),
            subtitle: Text('O\'zbek tili (Keyingi versiyada Rus tili)'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Get.snackbar(
                'Til sozlamalari',
                'Keyingi versiyada Rus tili qo\'shiladi',
                backgroundColor: Theme.of(context).primaryColor,
                colorText: Colors.white,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Column(
      children: [
        // Telefon
        Card(
          child: ListTile(
            leading: Icon(Icons.phone, color: Colors.green),
            title: Text('Telefon', style: TextStyle(fontFamily: 'Poppins')),
            subtitle: Text('+998 95 079 69 72'),
            trailing: Icon(Icons.call, color: Colors.green),
            onTap: () => _makePhoneCall('+998950796972'),
          ),
        ),

        SizedBox(height: 8),

        // Email
        Card(
          child: ListTile(
            leading: Icon(Icons.email, color: Colors.blue),
            title: Text('Email', style: TextStyle(fontFamily: 'Poppins')),
            subtitle: Text('info@harmangroup.uz'),
            trailing: Icon(Icons.send, color: Colors.blue),
            onTap: () => _sendEmail('info@harmangroup.uz'),
          ),
        ),

        SizedBox(height: 8),

        // Telegram
        Card(
          child: ListTile(
            leading: Icon(Icons.telegram, color: Colors.blue[700]),
            title: Text('Telegram', style: TextStyle(fontFamily: 'Poppins')),
            subtitle: Text('@harmangroup'),
            trailing: Icon(Icons.open_in_new, color: Colors.blue[700]),
            onTap: () => _openTelegram('@harmangroup'),
          ),
        ),
      ],
    );
  }

  Widget _buildAddressSection(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.red),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Bizning manzil',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 12),

            Text(
              'Toshkent shahar, Yakkasaroy tumani\nYakkasaroy mahallasi, 3-uy 6-xonadon',
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _openMap(),
                icon: Icon(Icons.map),
                label: Text(
                  'Xaritada ko\'rish',
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppInfoSection(BuildContext context) {
    return Column(
      children: [
        // Google Play'da baholash
        Card(
          child: ListTile(
            leading: Icon(Icons.star_rate, color: Colors.orange),
            title: Text(
              'Ilovani baholang',
              style: TextStyle(fontFamily: 'Poppins'),
            ),
            subtitle: Text('Google Play\'da 5 yulduz bering'),
            trailing: Icon(Icons.open_in_new),
            onTap: () => _rateApp(),
          ),
        ),

        SizedBox(height: 8),

        // Versiya
        Card(
          child: ListTile(
            leading: Icon(
              Icons.info_outline,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Ilova versiyasi',
              style: TextStyle(fontFamily: 'Poppins'),
            ),
            subtitle: FutureBuilder<PackageInfo>(
              future: PackageInfo.fromPlatform(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    'v${snapshot.data!.version} (${snapshot.data!.buildNumber})',
                  );
                }
                return Text('v1.0.0');
              },
            ),
          ),
        ),

        SizedBox(height: 8),

        // Privacy Policy
        Card(
          child: ListTile(
            leading: Icon(Icons.privacy_tip_outlined, color: Colors.grey[600]),
            title: Text(
              'Maxfiylik siyosati',
              style: TextStyle(fontFamily: 'Poppins'),
            ),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _showPrivacyPolicy(context),
          ),
        ),
      ],
    );
  }

  Widget _buildCopyright(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            '© 2025 Harman Group MCHJ',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4),
          Text(
            'Barcha huquqlar himoyalangan',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Action methods
  void _makePhoneCall(String phoneNumber) async {
    try {
      final uri = Uri(scheme: 'tel', path: phoneNumber);

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        // Agar to'g'ridan-to'g'ri qo'ng'iroq qilish imkonsiz bo'lsa
        // Dialer'ni ochib raqamni ko'rsatish
        final dialerUri = Uri.parse('tel:$phoneNumber');
        await launchUrl(dialerUri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      // Fallback - raqamni clipboard'ga nusxalash
      Get.snackbar(
        'Telefon',
        'Raqam: $phoneNumber\nQo\'lda terish uchun nusxalansin?',
        duration: Duration(seconds: 5),
        mainButton: TextButton(
          onPressed: () {
            // Clipboard'ga nusxalash (qo'shimcha package kerak: flutter pub add clipboard)
            Get.snackbar('Nusxalandi', phoneNumber);
          },
          child: Text('Nusxalash'),
        ),
      );
    }
  }

  void _sendEmail(String email) async {
    try {
      final uri = Uri(
        scheme: 'mailto',
        path: email,
        query:
            'subject=Harman Mebellar Olami&body=Salom, men ilovangiz haqida so\'roq qilmoqchiman...',
      );

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        // Fallback - oddiy mailto link
        final fallbackUri = Uri.parse('mailto:$email');
        await launchUrl(fallbackUri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      // Manual fallback - email manzilini ko'rsatish
      showDialog(
        context: Get.context!,
        builder: (context) => AlertDialog(
          title: Text('Email manzili'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Email ilovasi topilmadi. Email manzil:'),
              SizedBox(height: 8),
              SelectableText(
                email,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Yopish'),
            ),
          ],
        ),
      );
    }
  }

  void _openTelegram(String username) async {
    try {
      // Username'dan @ belgisini olib tashlash
      String cleanUsername = username.replaceAll('@', '');

      // Avval Telegram app orqali ochishga harakat
      final telegramAppUri = Uri.parse('tg://resolve?domain=$cleanUsername');

      if (await canLaunchUrl(telegramAppUri)) {
        await launchUrl(telegramAppUri, mode: LaunchMode.externalApplication);
        return;
      }

      // Agar Telegram app yo'q bo'lsa, web orqali ochish
      final webUri = Uri.parse('https://t.me/$cleanUsername');

      if (await canLaunchUrl(webUri)) {
        await launchUrl(webUri, mode: LaunchMode.externalApplication);
      } else {
        // Fallback
        throw Exception('Telegram ochish imkonsiz');
      }
    } catch (e) {
      // Manual fallback
      showDialog(
        context: Get.context!,
        builder: (context) => AlertDialog(
          title: Text('Telegram'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Telegram ochish imkonsiz. Username:'),
              SizedBox(height: 8),
              SelectableText(
                username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Qo\'lda qidirib toping yoki Telegram ilovasini o\'rnating.',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Yopish'),
            ),
          ],
        ),
      );
    }
  }

  void _openMap() async {
    try {
      // Google Maps web URL - eng universal variant
      final webMapUrl = 'https://maps.google.com/?q=41.281568,69.242895';
      final uri = Uri.parse(webMapUrl);

      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      // Fallback - manzilni dialog'da ko'rsatish
      showDialog(
        context: Get.context!,
        builder: (context) => AlertDialog(
          title: Text('Bizning manzil'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Xarita ochish imkonsiz. Bizning manzil:'),
              SizedBox(height: 8),
              SelectableText(
                'Toshkent shahar, Yakkasaroy tumani\nYakkasaroy mahallasi, 3-uy 6-xonadon',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Yopish'),
            ),
          ],
        ),
      );
    }
  }

  void _rateApp() async {
    // Google Play Store URL (package name bilan o'zgartiring)
    final url = 'market://details?id=com.harmangroup.mebelolami';
    final webUrl =
        'https://play.google.com/store/apps/details?id=com.harmangroup.mebelolami';

    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(
          Uri.parse(webUrl),
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      Get.snackbar('Xatolik', 'Google Play ochish imkonsiz');
    }
  }

  void _showPrivacyPolicy(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: Text('Maxfiylik siyosati'),
        content: SingleChildScrollView(
          child: Text(
            '''Harman Mebellar Olami ilovasi foydalanuvchilarning maxfiyligini himoya qiladi.

Ma'lumot yig'ish:
- Sevimli mahsulotlar ro'yxati
- Ilova sozlamalari (tungi rejim)

Ma'lumotlardan foydalanish:
- Faqat ilova funksiyalarini ta'minlash uchun
- Uchinchi tomonlarga berilmaydi

Aloqa:
info@harmangroup.uz

© 2025 Harman Group MCHJ''',
            style: TextStyle(fontFamily: 'Poppins'),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: Text('Yopish')),
        ],
      ),
    );
  }
}
