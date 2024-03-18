import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pen/Bloc/Cubit/app_cubit.dart';
import 'package:pen/Bloc/Cubit/app_states.dart';

import '../../Theme/text_style.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Privacy Policy'.tr(),
              style: textStyle(
                cubit,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '''
              Biz [Tercümeye Doğru] olarak, uygulamamızı kullanırken kişisel bilgilerinizi ve gizliliğinizi koruma taahhüdünde bulunuyoruz. Lütfen aşağıdaki Gizlilik Politikası beyanını okuyun, böylece kişisel bilgilerinizi nasıl topladığımızı, kullanıp koruduğumuzu anlayabilirsiniz.

              Topladığımız Bilgiler:

              Yeni bir hesap oluştururken, adınız ve e-posta adresiniz gibi temel kişisel bilgilerinizi topluyoruz.
              Performansınızı ve derslerde ilerlemenizi değerlendirmek amacıyla verileriniz kaydedilmektedir.
              Uygulama kullanımı ve içerikle etkileşim bilgilerinizi toplayarak performansımızı geliştirmek istiyoruz.

              Bilgilerinizin Kullanımı:

              Bilgilerinizi hizmetlerimizi sunmak ve kalitesini artırmak amacıyla kullanıyoruz.
              Performans verileri, dersleri özelleştirmek ve öğrenim deneyiminizi iyileştirmek için kullanılabilir.
              İzininiz olmadan bilgilerinizi üçüncü taraflarla paylaşmıyoruz.

              Erişim ve Kontrol Hakları:

              Kişisel bilgilerinize erişme, düzeltme veya silme hakkına sahipsiniz.
              Gizlilik ayarlarınızı hesabınızda düzenleyerek bilgilerinizin nasıl kullanılacağını belirleyebilirsiniz.

              Bilgi Güvenliği:

              Bilgilerinizi izinsiz erişim ve istenmeyen kullanımdan korumak için etkili güvenlik önlemleri alıyoruz.

              Gizlilik Politikası Güncellemeleri:

              Gizlilik politikasını, uygulamanın geliştirmelerine veya geçerli yasalara uygun hale getirmek için zaman zaman güncelliyoruz.

              Uygulamamızı kullanarak, bu Gizlilik Politikası'na uygun olarak bilgilerinizin toplanmasına ve kullanılmasına izin vermiş olursunuz. Gizlilikle ilgili herhangi bir sorunuz veya endişeniz varsa, lütfen [e-posta adresi] üzerinden bizimle iletişime geçin.
              ''',
                    style: textStyle(cubit),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
