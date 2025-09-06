import '../models/product.dart';
import 'categories_data.dart';

class ProductsData {
  static List<Product> getAllProducts() {
    return [
      Product(
        id: "1",
        name:
            "Yotoq o'rni ko'tariluvchi mexanizm bilan \"Samarqand\" Olcha / Qora",
        code: "HRM2024",
        price: 3500000, // 3,500,000 so'm
        oldPrice: 5250000, // 5,250,000 so'm
        discountPercent: 33,
        categoryId: "yotoqxona",
        hasDiscount: true,
        isNew: true,
        images: [
          "assets/images/products/yotoq_samarqand_1.jpg",
          "assets/images/products/yotoq_samarqand_2.jpg",
          "assets/images/products/yotoq_samarqand_3.jpg",
        ],
        description: """
"Samarqand" yotoq o'rni zamonaviy uslubda ishlab chiqarilgan bo'lib, har qanday yotoqxona interieriga mukammal mos keladi. Yumshoq bosh tayanch velur mato bilan qoplangan bo'lib, kitob o'qish yoki televizor ko'rish uchun maksimal qulaylik yaratadi.

Yotoq tagida keng saqlash joyi mavjud bo'lib, choyshablar, yostiqlar va boshqa narsalarni saqlash uchun ishlatiladi. Ko'tariluvchi mexanizm zamonaviy va ishonchli bo'lib, uzun yillar xizmat qiladi.

Ramka yuqori sifatli LDSTP materialidan tayyorlangan. Bosh tayanch mikrovelur mato bilan qoplangan bo'lib, 60,000 dan ortiq ishqalanish sikllariga bardosh beradi.

**Muhim:** Matras to'plamga kirmaydi va alohida sotib olinadi.
  """,
        features: [
          "Zamonaviy dizayn - amaliy materiallar va chiroyli shakl",
          "Yumshoq velur bosh tayanch maksimal qulaylik uchun",
          "Ko'tariluvchi mexanizm to'plamda",
          "Keng saqlash joyi choyshablar uchun",
          "Qoplama 60,000 dan ortiq ishqalanishga chidamli",
          "Bir kishi uchun 150 kg gacha yuk",
        ],
        specifications: {
          "Mahsulot kodi": "HRM.2024.01",
          "O'lchamlari (B x E x Ch)": "101,5 x 167,1 x 215,5 sm",
          "Yotoq o'lchami": "160 x 200 sm",
          "Turi": "Ikki kishilik yotoq",
          "Ishlab chiqaruvchi mamlakat": "O'zbekiston",
          "Uslub": "Zamonaviy",
          "Rang": "Olcha / Qora",
          "Ramka materiali": "LDSTP 16, 32 mm",
          "Qoplama materiali": "Mikrovelur (100% poliester)",
          "Qoplama zichligi": "420 g/m²",
          "Yuk ko'tarish": "150 kg gacha",
          "Kafolat": "18 oy",
          "Kolleksiya": "Samarqand",
          "Ishlab chiqaruvchi": "Harman Group MCHJ",
        },
      ),
      Product(
        id: "2",
        name: "Mehmon zali uchun devor shkafi \"Orneta\" №80 Yong'oq tusli",
        code: "KOMPL0723",
        price: 7588800, // 189,720 ₽ ning so'mdagi qiymati
        oldPrice: 18972000, // 474,300 ₽
        discountPercent: 60,
        categoryId: "zal",
        hasDiscount: true,
        isNew: false,
        images: [
          "assets/images/products/stenka_orneta_1.jpg",
          "assets/images/products/stenka_orneta_2.jpg",
          "assets/images/products/stenka_orneta_3.jpg",
          "assets/images/products/stenka_orneta_4.jpg",
        ],
        description: """
Zamonaviy mehmon zali uchun "Orneta" to'plami ikkita katta vitrinali shkaf, televizor o'rnatish uchun keng tumba va dekorativ buyumlarni saqlash uchun osma javondan iborat. To'plamning yorqin dizayn xususiyati - tabiiy bambuk qo'shimchalari bilan bezatilgan yuzalar.

To'plam har qanday zamonaviy mehmon zaliga mukammal mos keladi va o'zining noyob dizayni bilan xonaga sharqona ekzotika ta'mini qo'shadi. Shkaflarning yarim qismi shisha javonli ikkita bo'limga bo'lingan bo'lib, kitoblar, idishlar va dekorativ buyumlarni qo'yish mumkin.

Korpus yuqori sifatli LDStP materialidan tayyorlangan. Yuzalar ramkali MDF profildan tayyorlangan bo'lib, shisha va bambuk plitasi qo'shimchalari mavjud. Barcha furnitura dovakchilari bilan jihozlangan.

**Muhim:** To'plam yig'ilgan holda yetkazib beriladi va professional yig'ish xizmati tavsiya etiladi.
  """,
        features: [
          "Tabiiy bambuk qo'shimchalari yuzalarda sharqona ekzotika beradi",
          "Shisha javonli vitrinalar LED yoritgichli",
          "Dekorativ buyumlar uchun keng osma javon",
          "To'rtta tortma disk va aksessuarlar uchun",
          "Dovakchili furnitura jim va yumshoq yopilish uchun",
          "To'liq to'plam - yig'ilishga tayyor",
          "Professional LED yoritish tizimi",
          "Zamonaviy xromli tutqichlar",
        ],
        specifications: {
          "Mahsulot kodi": "KOMPL.0723.01",
          "O'lchamlari (B x E x Ch)": "215,4 x 320,6 x 37,8 sm",
          "To'plam tarkibi": "2 shkaf + tumba + osma javon",
          "Shkaf o'lchami": "215,4 x 80,2 x 37,8 sm (2 dona)",
          "Tumba o'lchami": "57,7 x 160,2 x 37,8 sm",
          "Osma javon": "56 x 160,2 x 25,4 sm",
          "Ishlab chiqaruvchi mamlakat": "Rossiya",
          "Uslub": "Zamonaviy",
          "Rang": "Yong'oq / Jigarrang",
          "Korpus materiali": "LDStP 16 mm",
          "Tumba ustki qismi": "LDStP 28 mm",
          "Yuzalar": "MDF ramka + shisha/bambuk",
          "Javonlar": "Shisha 5 mm, LDStP",
          "Tutqichlar": "Xromli, metall",
          "Yoritish": "LED",
          "Maksimal yuk": "Stolcha 25 kg, javon 11 kg",
          "Kafolat": "18 oy",
          "Kolleksiya": "Orneta",
          "Ishlab chiqaruvchi": "Rossiya mebel fabrikasi",
        },
      ),
      Product(
        id: "2",
        name: "Mehmon zali to'plami \"Luara\" №3 Kulrang",
        code: "KOMPLKX00099",
        price: 2033280, // 50,832 ₽ ning so'mdagi qiymati
        oldPrice: 5083200, // 127,080 ₽
        discountPercent: 60,
        categoryId: "zal",
        hasDiscount: true,
        isNew: true,
        images: [
          "assets/images/products/luara_grey_1.jpeg",
          "assets/images/products/luara_grey_2.jpg",
          "assets/images/products/luara_grey_3.jpg",
        ],
        description: """
Ixcham va minimalistik "Luara" mehmon zali to'plami neoklassik uslubdagi intererni bezashga yordam beradi. Bunday uslubdagi mebel - bu maksimal joziba, qulaylik va dinamiklik.

Televizor tumbasi va osma javonning lakonish dueti televizor oldida dam olish zonasini jihozlash uchun yordam beradi, ko'p joy egallamaydi va har qanday makon, hatto studiya kvartirasi uchun ham mos keladi.

To'plam neoklassik va Provans uslublarida bajarilgan bo'lib, kulrang rangda chiroyli ko'rinadi. Yuzalarda frezlash, so'kel va karnizlar dekor vazifasini bajaradi.

**Maxsus xususiyat:** Push-to-open mexanizmi - eshik tutqichsiz, yuzaga oddiy bosish bilan ochiladi.
  """,
        features: [
          "Elegant dekor - yuzalarda frezlash, so'kel va karnizlar",
          "Ikki xil tutqich - skoba va tugma bir rangda",
          "Push-to-open mexanizmi - tutqichsiz ochilish",
          "Ixcham va minimalistik dizayn",
          "Neoklassik va Provans uslublari",
          "Studiya kvartira uchun ham mos",
          "Televizor zonasi uchun optimal",
          "Yuqori sifatli belarus mebeli",
        ],
        specifications: {
          "Mahsulot kodi": "KOMPL.KX.00099",
          "O'lchamlari (B x E x Ch)": "66,4 x 180,4 x 40,3 sm",
          "To'plam tarkibi": "Osma javon + televizor tumbasi",
          "Osma javon": "20,4 x 130 x 21,6 sm",
          "Televizor tumbasi": "66,4 x 180,4 x 40,3 sm",
          "Ishlab chiqaruvchi mamlakat": "Belarus",
          "Uslub": "Provans / Neoklassika",
          "Rang": "Kulrang",
          "Korpus materiali": "LDStP 16 mm",
          "Yuzalar": "MDF 19 mm ramka + LDStP 8 mm",
          "Orqa devorlar": "XDF 3 mm",
          "Kroma": "PVX melamin qog'oz 0,5 mm",
          "Tutqichlar": "Skoba va tugma tutqich",
          "Maksimal yuk": "Qopqoq 15 kg, tortma 10 kg",
          "Polka yuki": "5 kg gacha",
          "Kafolat": "18 oy",
          "Kolleksiya": "Luara",
          "Ishlab chiqaruvchi": "Belarus mebel fabrikasi",
        },
      ),
      Product(
        id: "4",
        name: "Ofis kabineti uchun to'plam \"Kassiya\" №5 Kulrang",
        code: "KOMPLKX00093",
        price: 955360, // 23,884 ₽ ning so'mdagi qiymati
        oldPrice: 2388400, // 59,710 ₽
        discountPercent: 60,
        categoryId: "ofis",
        hasDiscount: true,
        isNew: true,
        images: [
          "assets/images/products/kassiya_komplekt_5_1.jpeg",
          "assets/images/products/kassiya_komplekt_5_2.jpeg",
          "assets/images/products/kassiya_komplekt_5_3.jpeg",
        ],
        description: """
Ixcham "Kassiya" ofis kabineti to'plami - bu uydagi ish joyi uchun ideal duet. 60 sm chuqurlikdagi stol modeli noutbuk bilan qulay ishlash uchun mo'ljallangan, rangdosh osma javon bilan to'ldirilgan.

Stolning ustiga A2 formatigacha varaqlar oson joylashadi. Stol ostidagi nicha zarur narsalarni qulay saqlash uchun yordam beradi. Universal rang gammasi har qanday xona dizayni uslubiga mos keladi.

Kulrang rang va chap tomondagi metall tayanch stolni o'ziga xos interior buyumiga aylantiradi. Yashirin javon darsliklar, hujjat papkalari va daftarlarni saqlash uchun mos.
  """,
        features: [
          "Yoqimli dizayn - kulrang va metall tayanchning kombinatsiyasi",
          "Mustahkam stolcha - 30 kg gacha yuk ko'taradi",
          "Yashirin javon kitob va hujjatlar uchun",
          "Sozlanadigan tayanchlar pol notekisligini bartaraf etadi",
          "Ixcham o'lcham kichik xonalar uchun",
          "Universal rang har qanday interega mos",
          "Noutbuk va A2 format hujjatlar uchun optimal",
          "Belarus sifati va ishonchliligi",
        ],
        specifications: {
          "Mahsulot kodi": "KOMPL.KX.00093",
          "O'lchamlari (B x E x Ch)": "77,5 x 120 x 60 sm",
          "To'plam tarkibi": "Yozuv stoli + osma javon",
          "Yozuv stoli": "77,5 x 120 x 60 sm",
          "Osma javon": "18,4 x 100,2 x 20 sm",
          "Ishlab chiqaruvchi mamlakat": "Belarus",
          "Uslub": "Zamonaviy / Loft",
          "Rang": "Kulrang",
          "Stolcha materiali": "LDStP 22 mm",
          "Korpus": "LDStP 16 mm",
          "Orqa devor": "LDStP 16 mm",
          "Tayanchlar": "Sozlanadigan (10-30 mm)",
          "Maksimal yuk": "Stolcha 30 kg, javon 5 kg",
          "Kafolat": "18 oy",
          "Kolleksiya": "Kassiya",
          "Ishlab chiqaruvchi": "Belarus mebel fabrikasi",
        },
      ),
      Product(
        id: "5",
        name:
            "Ofis kabineti uchun to'plam \"Kassiya\" №1 Kulrang / Yong'oq vatan",
        code: "KOMPLKX00089",
        price: 2911040, // 72,776 ₽ ning so'mdagi qiymati
        oldPrice: 7277600, // 181,940 ₽
        discountPercent: 60,
        categoryId: "ofis",
        hasDiscount: true,
        isNew: false,
        images: [
          "assets/images/products/kassiya_1_grey_oak_1.jpeg",
          "assets/images/products/kassiya_1_grey_oak_2.jpeg",
          "assets/images/products/kassiya_1_grey_oak_3.jpeg",
        ],
        description: """
Minimalistik uslubda bajarilgan "Kassiya" ofis kabineti to'plami har qanday xonada ish zonasini jihozlash uchun ideal. Modullarning zamonaviy dizayni turli xil bezak uslublariga mos keladigan universal rang gammasida bajarilgan.

Shkaf, stol va osma javon qulay ish maydonining bir qismi bo'lib, bu yerda nafaqat yuqori qulaylik sharoitida samarali ishlash, balki tanaffus paytida dam olish ham mumkin.

Korpus va yuzalarning kulrang rangi ochiq yong'oq vatan teksturali javonlar va devorlar bilan boyitilgan. Shkafda turli o'lchamdagi ikkita yopiq bo'lim arxiv hujjatlari va uslubiy qo'llanmalar uchun mo'ljallangan.
  """,
        features: [
          "Yoqimli rang palitra - kulrang va ochiq yong'oq vatan",
          "Shkafda turli o'lchamdagi ikkita yopiq bo'lim",
          "Tortmalar kantselyariya va shaxsiy buyumlar uchun",
          "ABS kroma himoya va chidamlilik uchun",
          "Sifatli furnitura abadiy kafolat bilan",
          "Dovakchili ilgaklar va yo'naltiruvchilar",
          "Yog'och tutqichlar (SIRO)",
          "To'liq tortma chiqarish mexanizmi",
        ],
        specifications: {
          "Mahsulot kodi": "KOMPL.KX.00089",
          "O'lchamlari (B x E x Ch)": "174,6 x 284,6 x 60 sm",
          "To'plam tarkibi": "Shkaf + yozuv stoli + osma javon",
          "Shkaf": "174,6 x 64,4 x 41,6 sm",
          "Yozuv stoli": "76,9 x 120 x 60 sm",
          "Osma javon": "76,9 x 120 x 60 sm",
          "Ishlab chiqaruvchi mamlakat": "Belarus",
          "Uslub": "Zamonaviy / Loft",
          "Rang": "Kulrang / Ochiq yong'oq",
          "Stolcha": "LDStP 22 mm",
          "Korpus": "LDStP 16 mm",
          "Stol ramkasi": "Metall rama + LDStP",
          "Kroma": "ABS 0,5-1 mm",
          "Tutqichlar": "Yog'och massivi (SIRO)",
          "Maksimal yuk": "Stolcha 40 kg, qopqoq 35 kg",
          "Kafolat": "18 oy",
          "Kolleksiya": "Kassiya",
          "Ishlab chiqaruvchi": "Belarus mebel fabrikasi",
        },
      ),
      Product(
        id: "7",
        name:
            "Ikki qavatli bolalar krovati \"Allegro\" 90x200 Oq / Yong'oq natural",
        code: "4651",
        price: 3530560, // 88,264 ₽ ning so'mdagi qiymati
        oldPrice: 8826400, // 220,660 ₽
        discountPercent: 60,
        categoryId: "bolalar",
        hasDiscount: true,
        isNew: false,
        images: [
          "assets/images/products/allegro_bunk_bed_1.jpeg",
          "assets/images/products/allegro_bunk_bed_2.jpeg",
          "assets/images/products/allegro_bunk_bed_3.jpeg",
        ],
        description: """
"Allegro" ikki qavatli krovati bolalar xonasining markaziy o'rnini egallaydi. Oq devorlarning yoqimli uyg'unligi, yog'och dekor panellari va zinapoya xona makonini yorug'lik va issiqlik bilan to'ldiradi.

Yuqori va pastki yotoq joylarining o'ylangan o'lchamlari qulay matraslar mavjud bo'lganda bolalaringizning maksimal tinch va foydali dam olishini ta'minlaydi. Zarurat bo'lganda krovatining funksionalligi pastki asosga narsalarni saqlash uchun qo'shimcha tortmalar o'rnatish orqali kengaytirilishi mumkin.

Himoya paneli bolaning yuqori yotoq joyidan yiqilishini oldini oladi. Zinapoya bolaga krovatining yuqori yotoq joyiga tez va xavfsiz chiqishga yordam beradi.
  """,
        features: [
          "Himoya paneli yuqori yotoq uchun xavfsizlik",
          "Mustahkam zinapoya xavfsiz ko'tarilish uchun",
          "Pastki qismga tortmalar o'rnatish mumkin",
          "Ekologik ABS kroma himoya uchun",
          "Sozlanadigan tayanchlar pol notekisligini bartaraf etadi",
          "Universal zinapoya har ikki tomonga o'rnatiladi",
          "100 kg gacha yuk ko'tarish qobiliyati",
          "Belarus sifati va ishonchliligi",
        ],
        specifications: {
          "Mahsulot kodi": "4651.d0.01u",
          "O'lchamlari (B x E x Ch)": "182,9 x 205,4 x 128,9 sm",
          "Yotoq o'lchami": "90 x 200 sm",
          "Turi": "Bolalar / Ikki qavatli",
          "Ishlab chiqaruvchi mamlakat": "Belarus",
          "Uslub": "Zamonaviy / Loft",
          "Rang": "Oq / Ochiq yong'och",
          "Kroat qismlari": "LDStP 22 mm, 16 mm",
          "Kroma": "ABS 0,5-1 mm",
          "Asos": "DStP to'plamda",
          "Tayanchlar": "Metall, sozlanadigan 1-2 sm",
          "Maksimal yuk": "Har bir yotoq 100 kg",
          "Zinapoya yuki": "50 kg gacha",
          "Matras chuqurlik": "11,4 sm",
          "Kafolat": "18 oy",
          "Kolleksiya": "Allegro",
          "Ishlab chiqaruvchi": "Belarus mebel fabrikasi",
        },
      ),
      Product(
        id: "8",
        name:
            "Bolalar xonasi to'plami \"Jelato\" №4 Yong'oq Vinchentsa / Beton / Bordo",
        code: "KOMPLDD00177",
        price: 2826840, // 70,671 ₽ ning so'mdagi qiymati
        oldPrice: 9422800, // 235,570 ₽
        discountPercent: 70,
        categoryId: "bolalar",
        hasDiscount: true,
        isNew: true,
        images: [
          "assets/images/products/jelato_4_set_1.jpeg",
          "assets/images/products/jelato_4_set_2.jpeg",
          "assets/images/products/jelato_4_set_3.jpeg",
          "assets/images/products/jelato_4_set_4.jpeg",
        ],
        description: """
"Jelato" bolalar xonasi mebel to'plami - bu o'g'il yoki qiz xonasi uchun funksional va zamonaviy yechim. Ixcham bir kishilik krovatni ko'p joy egallamaydi, lekin o'spirin uchun uyqu va dam olish qulayligini ta'minlaydi.

Sig'imli shkaf va tumba bolaning barcha narsalarini qulay joylashtirish imkonini beradi, krovatining ikkita tortmasini choyshablarni saqlash uchun ishlatish mumkin.

Universal rang gammasi - yuzalardagi tabiiy teksturalarning uyg'un birikmasi har qanday yosh guruhi va jinsdagi bolalar uchun mos keladi. Yumshoq bosh tayanch mikrovelur mato bilan qoplangan.
  """,
        features: [
          "Universal rang gammasi har qanday yosh va jins uchun",
          "Optimal saqlash tashkili - shkaf va tumba",
          "Dovakchili yo'naltiruvchi va ilgaklar xavfsizlik uchun",
          "Sozlanadigan tayanchlar pol tekisligi uchun",
          "Ishonchli furnitura Lazurit kafolati bilan",
          "Krovatda ikkita tortma choyshablar uchun",
          "Yumshoq mikrovelur bosh tayanch",
          "Shkafni devorga mahkamlash majburiy",
        ],
        specifications: {
          "Mahsulot kodi": "KOMPL.DD.00177",
          "O'lchamlari (B x E x Ch)": "221,8 x 265,2 x 210 sm",
          "To'plam tarkibi": "Krovatni + shkaf + tumba",
          "Krovatni": "99,6 x 210 x 101 sm",
          "Shkaf": "221,8 x 124 x 64,1 sm",
          "Tumba": "43,1 x 40,2 x 39,8 sm",
          "Ishlab chiqaruvchi mamlakat": "Belarus",
          "Uslub": "Zamonaviy / Minimalizm",
          "Rang": "Yong'oq / Qizil / Kulrang",
          "Ramka": "LDStP 16 mm",
          "Bosh tayanch": "DStP + sintepon + mikrovelur",
          "Qoplama": "Mikrovelur (100% poliester)",
          "Qoplama zichligi": "360 g/m²",
          "Chidamlilik": "100,000 sikl",
          "Maksimal yuk": "Krovatni 100 kg, javon 5 kg",
          "Bosh tayanch qalinlik": "7 sm",
          "Kafolat": "18 oy",
          "Kolleksiya": "Jelato",
          "Ishlab chiqaruvchi": "Belarus mebel fabrikasi",
        },
      ),
      Product(
        id: "9",
        name: "Yayiladigan ovqat stoli \"DANTE\" Qora / Vintage yong'oq",
        code: "sDT01",
        price: 2000160, // 50,004 ₽ ning so'mdagi qiymati
        oldPrice: 5000400, // 125,010 ₽
        discountPercent: 60,
        categoryId: "ovqat_xonasi",
        hasDiscount: true,
        isNew: false,
        images: [
          "assets/images/products/dante_table_1_csecollege.jpg",
          "assets/images/products/dante_table_2_csecollege.jpg",
          "assets/images/products/dante_table_3_csecollege.jpg",
        ],
        description: """
Dumaloq stolchali "DANTE" yayiladigan ovqat stoli - kichik oshxona yoki studiya uchun yechim. Stolcha 40 sm ga kengayadi, shuning uchun unga ko'proq taomlar qo'yish mumkin bo'ladi.

Markaziy tayanch tufayli barcha mehmonlar stol atrofida qulay bo'lishadi. Dumaloq shakli burchakka urilish xavfini yo'q qiladi. "Kapalak" mexanizmi stolchaning yarmlarini yon tomonlarga siljitadi va ichki qo'shimcha markazga o'rnatiladi.

Sharli yo'naltiruvchilar stolni silliq va ovozsiz transformatsiya qilish imkonini beradi. Markaziy tayanchdagi joylashuv tufayli stol ostida oyoqlar uchun ko'proq bo'sh joy mavjud.
  """,
        features: [
          "Kapalak mexanizmi 40 sm ga kengayish",
          "Sharli yo'naltiruvchilar silliq harakatlanish uchun",
          "Markaziy tayanch oyoqlar uchun ko'proq joy",
          "Dumaloq shakl xavfsizlik uchun",
          "Ovozsiz transformatsiya mexanizmi",
          "Kichik joy egallaydi",
          "Studiya kvartira uchun ideal",
          "Rossiya sifati va ishonchliligi",
        ],
        specifications: {
          "Mahsulot kodi": "sDT01.d0.03u",
          "O'lchamlari (B x E x Ch)": "75 x 120 x 120 sm",
          "Yoyilgan holda": "76 x 160 x 120 sm",
          "Stolcha": "LDStP 38 mm (22+16 mm)",
          "Tayanchlar": "Metall",
          "Yo'naltiruvchilar": "Sharli",
          "Mexanizm": "Kapalak",
          "Kengayish qo'shimchasi": "40 sm",
          "Ishlab chiqaruvchi mamlakat": "Rossiya",
          "Uslub": "Zamonaviy / Loft",
          "Rang": "Qora / Quyuq yong'oq",
          "Kafolat": "18 oy",
          "Kolleksiya": "DANTE",
          "Ishlab chiqaruvchi": "Rossiya mebel fabrikasi",
        },
      ),

      Product(
        id: "10",
        name: "Yayiladigan ovqat stoli \"ROM-110\" Qora / Tutunli keramika",
        code: "sRM03",
        price: 1199520, // 29,988 ₽ ning so'mdagi qiymati
        oldPrice: 2998800, // 74,970 ₽
        discountPercent: 60,
        categoryId: "ovqat_xonasi",
        hasDiscount: true,
        isNew: true,
        images: [
          "assets/images/products/rom_110_table_1_csecollege.jpg",
          "assets/images/products/rom_110_table_2_csecollege.jpg",
          "assets/images/products/rom_110_table_3_csecollege.jpg",
        ],
        description: """
"ROM" yayiladigan ovqat stoli nafaqat kundalik foydalanish uchun, balki mehmonlarni kutib olish uchun ham mos keladi. Stolcha 32 sm ga kengayadi, shuning uchun unga ko'proq taomlar qo'yish mumkin bo'ladi.

"Kapalak" mexanizmi stolchaning yarmlarini yon tomonlarga siljitadi va ichki qo'shimcha markazga o'rnatiladi. Sharli yo'naltiruvchilar stolni silliq va ovozsiz transformatsiya qilish imkonini beradi.

Tayanchlar stolchaga nisbatan burchak ostida joylashgan, bu stolning chayqalishiga yo'l qo'ymaydi va uni yanada barqaror qiladi. Tutunli keramika yuzasi zamonaviy va chiroyli ko'rinish beradi.
  """,
        features: [
          "Kapalak mexanizmi 32 sm ga kengayish",
          "Sharli yo'naltiruvchilar silliq harakat uchun",
          "Burchakli tayanchlar barqarorlik uchun",
          "Tutunli keramika zamonaviy ko'rinish",
          "100 kg gacha yuk ko'tarish",
          "Ixcham va funksional",
          "Mehmonlar uchun ideal",
          "Ovozsiz transformatsiya",
        ],
        specifications: {
          "Mahsulot kodi": "sRM03.d0.04u",
          "O'lchamlari (B x E x Ch)": "76 x 110 x 70 sm",
          "Yoyilgan holda": "76 x 142 x 70 sm",
          "Stolcha": "LDStP 38 mm (22+16 mm)",
          "Kengayish qo'shimchasi": "32 sm",
          "Tayanchlar": "Metall, kukun qoplama",
          "Yo'naltiruvchilar": "Sharli",
          "Mexanizm": "Kapalak",
          "Maksimal yuk": "100 kg",
          "Ishlab chiqaruvchi mamlakat": "Rossiya",
          "Uslub": "Zamonaviy / Loft",
          "Rang": "Qora / Kulrang",
          "Kafolat": "18 oy",
          "Kolleksiya": "ROM",
          "Ishlab chiqaruvchi": "Rossiya mebel fabrikasi",
        },
      ),
    ];
  }

  // Kategoriya bo'yicha filter - YANGI!
  static List<Product> getProductsByCategory(String categoryId) {
    return getAllProducts()
        .where((product) => product.categoryId == categoryId)
        .toList();
  }

  // Kategoriya nomi bo'yicha
  static List<Product> getProductsByCategoryName(String categoryName) {
    final category = CategoriesData.getAllCategories().firstWhere(
      (cat) => cat.nameUz == categoryName || cat.name == categoryName,
    );
    return getProductsByCategory(category.id);
  }

  // Yangi mahsulotlar
  static List<Product> getNewProducts() {
    return getAllProducts().where((product) => product.isNew).toList();
  }

  // Chegirmali mahsulotlar
  static List<Product> getDiscountedProducts() {
    return getAllProducts().where((product) => product.hasDiscount).toList();
  }

  // Qidiruv - umumiy
  static List<Product> searchProducts(String query) {
    final lowercaseQuery = query.toLowerCase();
    return getAllProducts()
        .where(
          (product) =>
              product.name.toLowerCase().contains(lowercaseQuery) ||
              product.code.toLowerCase().contains(lowercaseQuery) ||
              (product.category?.nameUz.toLowerCase().contains(
                    lowercaseQuery,
                  ) ??
                  false),
        )
        .toList();
  }

  // Kategoriya ichida qidiruv
  static List<Product> searchInCategory(String categoryId, String query) {
    final categoryProducts = getProductsByCategory(categoryId);
    final lowercaseQuery = query.toLowerCase();
    return categoryProducts
        .where(
          (product) =>
              product.name.toLowerCase().contains(lowercaseQuery) ||
              product.code.toLowerCase().contains(lowercaseQuery),
        )
        .toList();
  }
}
