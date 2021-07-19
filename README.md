# MobileHW3
Swift Programming Language - Mobile App Development Course - Sharif University of Technology
<p dir="rtl">
# تمرین ۳ درس برنامه‌سازی موبایل
<p dir="rtl">
## اعضای تیم
سید پارسا نشایی - &#x202b;98106134
محمدطه جهانی‌نژاد - &#x202b;98101363
مهدی ابوترابی - &#x202b;98105557
<p dir="rtl">
# اجرای برنامه

<p dir="rtl">
برنامه به شکل یک پروژه‌ی Xcode در GitHub آپلود شده و صحت اجرای آن در Xcode 12.5 بررسی شده است. اجرای برنامه از اسکریپت موجود در main.swift اجرا می‌شود، به گونه‌ای که خط ۱۰ این فایل در هنگام اجرای پروژه، اجرا خواهد شد.
از مفاهیم شی‌گرایی Swift در طراحی برنامه استفاده شده است.
  

<p dir="rtl">
# امکانات برنامه
<p dir="rtl">
پس از خوش‌آمدگویی، با وارد کردن عدد ۱ (عددها و عبارات همه به انگلیسی وارد می‌شوند) می‌توانیم یک todo جدید اضافه کنیم. سپس عنوان و محتوا و priority آن (که یک عدد طبیعی است) وارد می‌شود.
<p dir="rtl">
با وارد کردن عدد ۲ تمام todo ها نمایش داده می‌شوند. این نمایش شامل id (که به صورت خودکار توسط خود سیستم ساخته شده است)، عنوان، محتوا، priority و تاریخ ساخت است.
<p dir="rtl">
با وارد کردن عدد ۳ می‌توان جزئیات یک todo را عوض کرد؛ با وارد کردن این عدد، ابتدا تمام todo ها نمایش داده شده و سپس فیلد id (که رشته‌ی UUID ای است که توسط خود سیستم ساخته شده است) مربوط به todo ای که می‌خواهیم آن را edit کنیم را وارد می‌کنیم (در صورت اشتباه وارد کردن آن، خطای No Todo with the given ID found چاپ می‌شود). سپس به ازای هر فیلد todo (یعنی عنوان، محتوا و یا priority)، به ترتیب، اگر بخواهیم آن را تغییر دهیم، مقدار جدیدش را وارد می‌کنیم وگرنه صرفا enter می‌زنیم. در پایان، todo به شکل مشخص شده، تغییر می‌کند.
<p dir="rtl">
با وارد کردن عدد ۴ می‌توانیم یک todo را حذف کنیم؛  با وارد کردن این عدد، ابتدا تمام todo ها نمایش داده شده و سپس فیلد id (که رشته‌ی UUID ای است که توسط خود سیستم ساخته شده است) مربوط به todo ای که می‌خواهیم آن را حذف کنیم را وارد می‌کنیم (در صورت اشتباه وارد کردن آن، خطای No Todo with the given ID found چاپ می‌شود). سپس todo حذف می‌شود. اگر هیچ todo ای در سیستم موجود نباشد، در صورت اقدام به مشاهده‌ی لیست todo ها، خطای No Todo found :( را مشاهده می‌کنیم.
<p dir="rtl">
با وارد کردن عدد ۵ می‌توان لیست todo ها را در حالت مرتب‌شده مشاهده کرد. پس از ورود این عدد، ابتدا پرسیده می‌شود که قصد مرتب‌سازی صعودی را داریم و یا نزولی؛ اگر عدد ۱ را در این قسمت وارد کنیم، مرتب‌سازی صعودی وگرنه نزولی است. سپس خاصیتی که بر اساس آن مرتب‌سازی را انجام می‌دهیم (تاریخ ساخت، عنوان یا اولویت) را وارد می‌کنیم؛ اگر در این قسمت ۱ وارد کنیم به معنی مرتب‌سازی بر اساس تاریخ ساخت، اگر ۲ وارد کنیم به معنی مرتب‌سازی بر اساس عنوان todo و اگر ۳ وارد کنیم به معنی مرتب‌سازی بر اساس عدد اولویت است. در نهایت و در صورت موفقیت، لیست مرتب‌شده چاپ خواهد شد.
<p dir="rtl">
با وارد کردن عدد ۶ می‌توانیم یک دسته‌بندی ایجاد کنیم. پس از وارد کردن این عدد، کافی است اسم دسته‌بندی جدید را وارد کنیم.
<p dir="rtl">
با وارد کردن عدد ۷، لیستی از تمام دسته‌بندی‌ها به همراه تعداد todo هایی که در هر کدام قرار دارد، نمایش داده خواهد شد.
<p dir="rtl">
با وارد کردن عدد ۸ یک todo را به یک دسته‌بندی اضافه کرد؛ با وارد کردن این عدد، ابتدا تمام todo ها نمایش داده شده و سپس فیلد id (که رشته‌ی UUID ای است که توسط خود سیستم ساخته شده است) مربوط به todo ای که می‌خواهیم آن را به دسته‌بندی‌ای بیفزاییم را وارد می‌کنیم (در صورت اشتباه وارد کردن آن، خطای No Todo with this ID is found. چاپ می‌شود). سپس تمام دسته‌بندی‌ها نمایش داده شده و سپس نام مربوط به دسته‌بندی‌ای که می‌خواهیم به آن todo بیفزاییم را وارد می‌کنیم (در صورت اشتباه وارد کردن آن، خطای No Category with this title is found. چاپ می‌شود). در نهایت و در صورت موفقیت، todo به دسته‌بندی مشخص شده افزوده خواهد شد و علاوه بر چاپ پیغام تایید، لیستی از todo های کنونی دسته‌بندی‌ای که به آن todo افزوده‌ایم، چاپ می‌شود.
<p dir="rtl">
با وارد کردن عدد ۹ می‌توان تمام todo های یک دسته‌بندی را مشاهده کرد؛ با وارد کردن این عدد، ابتدا تمام دسته‌بندی‌ها نمایش داده شده و سپس نام مربوط به دسته‌بندی‌ای که می‌خواهیم todo های آن را ببینیم را وارد می‌کنیم (در صورت اشتباه وارد کردن آن، خطای No Category with this title is found. چاپ می‌شود). در نهایت و در صورت موفقیت، اگر در دسته‌بندی انتخاب شده، todo ای موجود نبود، No Todo found :( نمایش داده شده و در غیر این صورت، لیست todo های دسته‌بندی انتخاب شده، نمایش داده خواهد شد.
<p dir="rtl">
با وارد کردن عدد ۱۰ می‌توان دسته‌بندی‌هایی که یک todo در آن قرار دارد را مشاهده کرد؛ با وارد کردن این عدد، ابتدا تمام todo ها نمایش داده شده و سپس نام مربوط به todo ای که می‌خواهیم به آن todo بیفزاییم را وارد می‌کنیم (در صورت اشتباه وارد کردن آن، خطای No Todo with this ID is found. چاپ می‌شود). در نهایت و در صورت موفقیت، اگر todoی انتخاب شده، دردسته‌بندی‌ای موجود نبود، No category found :( نمایش داده شده و در غیر این صورت، لیست دسته‌بندی‌هایی که todo در آن قرار دارد، نمایش داده خواهد شد.
<p dir="rtl">
با وارد کردن عدد ۱۱، از برنامه خارج می‌شویم.
</p>
