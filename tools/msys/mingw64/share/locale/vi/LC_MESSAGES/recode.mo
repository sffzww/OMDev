��    P      �  k         �  K   �  �    �   �  �   b	  8  *
  �  c  �     |  �  0   +  9   \  6   �  C   �               6     U     i  9   r     �     �     �     �  -   �  $     5   @  '   v  $   �  $   �  $   �          +  &   E     l     �  J   �  $   �          "  H   0     y     �     �     �     �     �  "   �     "  1   6     h  (   w     �     �     �  &   �          &     ?  "   N     q  0   �     �  (   �     �  �     �  �  "   D     g  �   �     
  &   )     P     e     ~  �   �  7   m     �  
   �     �     �  y  �  T   =  �  �  �   !!  9  �!  4  �"  V  0&    �(    �)  <   �+  ^   �+  I   R,  T   �,     �,  1   �,  2   0-     c-     }-  Q   �-     �-     �-     .     .  >   >.  9   }.  H   �.  1    /  <   2/  3   o/  6   �/  '   �/  '   0  <   *0     g0     |0  �   �0  D   1      `1  !   �1  f   �1     
2     $2  8   B2  .   {2     �2     �2  2   �2  -   3  6   <3     s3  ;   �3  #   �3     �3  !   4  =   &4     d4     w4     �4  (   �4  &   �4  C   �4     :5  >   X5     �5  �   �5    p6  9   �9     �9  �   �9  #   �:  6   �:  &   �:     ;     <;  �   Y;  8   W<     �<     �<     �<     �<        G       B   :   A   1      (   	          >              M   P       0             ;          F   !       '   .       $   3                     7   -         9   ,   *       #          5       E      )   2   4      @   ?       
       <           H                        +   =      C   D                  N          O       I   K   8          6                 &   J       "   L   %   /       
Copyright (C) 1990, 92, 93, 94, 96, 97, 99 Free Software Foundation, Inc.
 
Fine tuning:
  -s, --strict           use strict mappings, even loose characters
  -d, --diacritics       convert only diacritics or alike for HTML/LaTeX
  -S, --source[=LN]      limit recoding to strings and comments as for LN
  -c, --colons           use colons instead of double quotes for diaeresis
  -g, --graphics         approximate IBMPC rulers by ASCII graphics
  -x, --ignore=CHARSET   ignore CHARSET while choosing a recoding path
 
If a long option shows an argument as mandatory, then it is mandatory
for the equivalent short option also.  Similarly for optional arguments.
 
If none of -i and -p are given, presume -p if no FILE, else -i.
Each FILE is recoded over itself, destroying the original.  If no
FILE is specified, then act as a filter and recode stdin to stdout.
 
Listings:
  -l, --list[=FORMAT]        list one or all known charsets and aliases
  -k, --known=PAIRS          restrict charsets according to known PAIRS list
  -h, --header[=[LN/]NAME]   write table NAME on stdout using LN, then exit
  -F, --freeze-tables        write out a C module holding all tables
  -T, --find-subsets         report all charsets being subset of others
  -C, --copyright            display Copyright and copying conditions
      --help                 display this help and exit
      --version              output version information and exit
 
Operation modes:
  -v, --verbose           explain sequence of steps and report progress
  -q, --quiet, --silent   inhibit messages about irreversible recodings
  -f, --force             force recodings even when not reversible
  -t, --touch             touch the recoded files after replacement
  -i, --sequence=files    use intermediate files for sequencing passes
      --sequence=memory   use memory buffers for sequencing passes
 
Option -l with no FORMAT nor CHARSET list available charsets and surfaces.
FORMAT is `decimal', `octal', `hexadecimal' or `full' (or one of `dohf').
 
REQUEST is SUBREQUEST[,SUBREQUEST]...; SUBREQUEST is ENCODING[..ENCODING]...
ENCODING is [CHARSET][/[SURFACE]]...; REQUEST often looks like BEFORE..AFTER,
with BEFORE and AFTER being charsets.  An omitted CHARSET implies the usual
charset; an omitted [/SURFACE]... means the implied surfaces for CHARSET; a /
with an empty surface name means no surfaces at all.  See the manual.
 
Report bugs to <recode-bugs@iro.umontreal.ca>.
 
Usage: %s [OPTION]... [ [CHARSET] | REQUEST [FILE]... ]
   -p, --sequence=pipe     same as -i (on this system)
   -p, --sequence=pipe     use pipe machinery for sequencing passes
  done
  failed: %s in step `%s..%s'
 %s failed: %s in step `%s..%s' %s in step `%s..%s' %s to %s %sConversion table generated mechanically by Free `%s' %s %sfor sequence %s.%s *Unachievable* *mere copy* Ambiguous output Cannot complete table from set of known pairs Cannot invert given one-to-one table Cannot list `%s', no names available for this charset Charset %s already exists and is not %s Charset `%s' is unknown or ambiguous Child process wait status is 0x%0.2x Codes %3d and %3d both recode to %3d Dec  Oct Hex   UCS2  Mne  %s
 Expecting `..' in request Following diagnostics for `%s' to `%s' Format `%s' is ambiguous Format `%s' is unknown Free `recode' converts files between various character sets and surfaces.
 Identity recoding, not worth a table Internal recoding bug Invalid input LN is some language, it may be `c', `perl' or `po'; `c' is the default.
 Language `%s' is ambiguous Language `%s' is unknown Misuse of recoding library No character recodes to %3d No error No table to print No way to recode from `%s' to `%s' Non canonical input Pair no. %d: <%3d, %3d> conflicts with <%3d, %3d> Recoding %s... Recoding is too complex for a mere table Request `%s' is erroneous Request: %s
 Required argument is missing Resurfacer set more than once for `%s' Sequence `%s' is ambiguous Sequence `%s' is unknown Shrunk to: %s
 Sorry, no names available for `%s' Step initialisation failed Step initialisation failed (unprocessed options) Symbol `%s' is unknown Syntax is deprecated, please prefer `%s' System detected problem This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software Foundation,
Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 Try `%s %s' for more information.
 UCS2   Mne   Description

 Unless DEFAULT_CHARSET is set in environment, CHARSET defaults to the locale
dependent encoding, determined by LC_ALL, LC_CTYPE, LANG.
 Unrecognised surface name `%s' Unsurfacer set more than once for `%s' Untranslatable input Virtual memory exhausted Virtual memory exhausted! With -k, possible before charsets are listed for the given after CHARSET,
both being tabular charsets, with PAIRS of the form `BEF1:AFT1,BEF2:AFT2,...'
and BEFs and AFTs being codes are given as decimal numbers.
 Written by Franc,ois Pinard <pinard@iro.umontreal.ca>.
 byte reversible ucs2 variable Project-Id-Version: recode 3.6
Report-Msgid-Bugs-To: <recode-bugs@iro.umontreal.ca>
POT-Creation-Date: 2001-01-02 22:35+0100
PO-Revision-Date: 2005-02-20 18:44+0950
Last-Translator: Clytie Siddall <clytie@riverland.net.au>
Language-Team: Vietnamese <gnomevi-list@lists.sourceforge.net> 
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
 
Bản quyền (C) năm 1990, 92, 93, 94, 96, 97, 99 Free Software Foundation, Inc.
 
Điều hưởng tinh:
  -s, --strict           sử dụng ánh xạ _chặt chẽ_, ngay cả ký tự phóng
  -d, --diacritics       chuyển đổi chỉ _dấu phụ_ hay điều như nhau đối với HTML/LaTeX
  -S, --source[=NGÔN_NGỮ]    hạn chế việc ma hóa lại nên chỉ xử lý chuỗi và chú thích như ngôn ngữ ấy (_nguồn_)
  -c, --colons           sử dụng _dấu hai chấm_ thay thế dấu nháy kép cho dấu tách đôi
  -g, --graphics         ước các thước đo IBMPC bằng _đồ họa_ ASCII
  -x, --ignore=BÔ_KÝ_TỰ   _bỏ qua_ bộ ký tự ấy khi chọn đường dẫn mã hóa lại
 
Nếu tùy chọn dài phải có đối số thì tùy chọn ngắn thích hợp cũng vậy.
Đối với đối số tùy chọn thì cách giống nhau.
 
Nếu chưa nhận -i và -p thì giả sử -p nếu không có TẬP_TIN, nếu có thì -i.
Sẽ mã hóa lại mỗi TẬP_TIN trên mình nên xóa bỏ điều trước. Nếu chưa ghi rõ TẬP_TIN
thì thay quyền trình lọc và mã hóa lại dữ liệu gõ chuẩn ra thiết bị xuất chuẩn.
 
Danh sách:
  -l, --list[=DẠNG]        _ghi danh sach_ một hay tất cả bộ ký tự và biệt hiệu được biết
  -k, --known=CẶP          hạn chế bộ ký tự theo danh sách CẶP _được biết_
  -h, --header[=[NGÔN_NGỮ/]TÊN]   ghi TÊN bảng ra thiết bị xuất chuẩn bằng sử dụng ngôn ngữ ấy rồi thoát (_đầu đề_)
  -F, --freeze-tables        ghi ra mô-đun C chứa tất cả _bảng_ (_làm đông đặc_)
  -T, --find-subsets         thông báo tât cả bộ ký tự là _nhóm phụ_ của bộ khác (_tìm_)
  -C, --copyright            hiển thị các điều kiện _bản quyền_ và sao chép
      --help                 hiển thị _trợ giúp_ này rồi thoát
      --version              xuất thông tin _phiên bản_ rồi thoát
 
Chế độ thi hành:
  -v, --verbose           giải thích dãy bước và thông báo tiến trình (_chi tiết_)
  -q, --quiet, --silent   thu hồi các thông điệp về việc mã hóa lại không hoàn tác (_im_)
  -f, --force             _buộc_ tất cả việc mã hóa lại ngay cả khi không thể hoàn tác
  -t, --touch             _sờ_ mọi tập tin được mã hóa lại sau khi thay thế
  -i, --sequence=files    sử dụng _tâp tin_ trung cấp cho việc _sắp xếp_ 
      --sequence=memory   sử dụng bộ đệm _nhớ_ cho việc _sắp xếp_
 
Khi tùy chọn -l không có DẠNG hay BỘ KÝ TỰ thi ghi danh sách tất cả bộ ký tự và mặt sẵn sàng.
DẠNG là `decimal' (thập phân), `octal' (bát phân), `hexadecimal' (thập lục phân) hay `full' (toàn) (hay một của chữ đầu `dohf').
 
LỜI_YÊU_CẦU là PHỤ_LỜI_YÊU_CẦU[,PHỤ_LỜI_YÊU_CẦU]...;
PHỤ_LỜI_YÊU_CẦU là BIÊN_MÃ [..BIÊN_MÃ]... BIÊN_MÃ là [BỘ_KÝ_TỰ][/[MẶT]]...;
LỜI_YÊU_CẦU thường hình như TRƯỚC..SAU, mà cả hai TRƯỚC và SAU là bô ký tự.
Khi không nhập BỘ_KÝ_TỰ nên sử dụng bộ ký tự thường; khi không nhập [/MẶT]...
nên sử dụng những mặt ngụ ý cho BỘ_KÝ_TỰ; ký tự / có tên mặt trống có nghĩa là
không có mặt nào. Hãy xem sổ hướng dẫn.
 
Hãy thông báo lỗi cho <recode-bugs@iro.umontreal.ca>.
 
Cách sử dụng: %s [TÙY_CHỌN]... [ [BỘ_KÝ_TỰ] | LỜI_YÊU_CẦU [TẬP_TIN]... ]
   -p, --sequence=pipe     bằng cờ -i (trên hệ điều hành này)
   -p, --sequence=pipe     sử dụng thiết bị _ống_ cho việc _sắp xếp_
  xong rồi
  không xong được: %s trong bước `%s..%s'
 %s không xong được: %s trong bước `%s..%s' %s trong bước `%s..%s' %s thành %s %sBảng chuyển đổi được tạo ra tự động do Free (Tự do) `%s' %s %sđối với dãy %s.%s *Không xong đươc* *chỉ bản sao* Dữ liệu xuất là mơ hồ Không thể xong tạo bảng từ bộ cặp được biết Không đảo được bảng một-đối-một đã cho Không ghi `%s' được vì không có tên nào cho bộ ký tự này Bộ ký tự %s tồn tại rồi, không là %s Bộ ký tự `%s' là chưa được biệt hoặc mơ hồ Trạng thái đời của xử lý con là 0x%0.2x Có mã hóa lại cả hai mã %3d và %3d thành %3d Hệ2  Hệ8  Hệ16   UCS2  Nhớ  %s
 Đang ngờ `..' trong lời yêu cầu Đang theo phương pháp chẩn đoán cho `%s' đến `%s' Dạng `%s' mơ hồ Chưa biết dạng `%s'  Chương trình `recode' (mã hóa lại) tự do thì chuyển đổi tập tin giữa nhiều bộ ký tự và mặt khác nhau.
 Việc mã hóa lại chỉ giống hệt, không cần bảng toàn Lỗi mã hóa lại nội  bộ Dữ liệu gõ không hợp lệ LN hay NGÔN_NGỮ là một ngôn ngữ, có thể `c', `perl' hay `po'; còn `c' là mặc định.
 Ngôn ngữ `%s' mơ hồ Chưa biết ngôn ngữ `%s' Không sử dụng thư viện mã hóa lại cho đúng Không mã hóa lại ký tự nào thành %3d Không có lỗi Không có bảng nào để in Không có cách mã hóa lại tư `%s' sang `%s' Dữ liệụ gõ không đúng tiêu chuẩn Số cặp %d: <%3d, %3d> xung đột với <%3d, %3d> Đang mã hóa lại %s... Việc mã hóa lại quá phức tạp đối với bảng Lời yêu cầu `%s' không đúng Lời yêu cầu: %s
 Thiếu đốí số bắt buộc Đã lập việc tạo mặt lại hơn một lần cho `%s' Dãy `%s' mơ hồ Chưa biết dãy `%s'  Đã co lại cho: %s
 Tiếc là không có tên nào cho `%s' Không khởi động bước được Không khởi động bước được (chưa xử lý tùy chọn) Chưa biết ký hiệu `%s'  Phản đối cú pháp ấy, hãy sử dụng `%s' thay thế Hệ thống mới gặp lỗi Đây là phần mềm tự do; hãy xem mã nguồn để thấy điều kiện sao chép.
Không bảo đảm gì cả, dù khả năng bán hay khả năng làm việc dứt khoát.
 Chương trình này là phần mềm tự do; bạn có thể phân phối và/hay sửa đổí
nó với điều kiện cua Quyền Công Chung Gnu (GPL) như được xuất do
Free Software Foundation; hoặc phiên bản 2, hoặc (tùy chọn)
bất cứ phiên bản sau nào.

Chúng tôi phân phối chương trình này vì mong nó có ích, nhưng
không bảo đảm gì cả, không bảo đảm một cách ngụ ý
khả năng bán hay khả năng làm việc dứt khoát. Hãy xem
Quyền Công Chung Gnu để tim thấy chi tiết thêm.

Bạn nên được nhận một bản Quyền Công Chung Gnu với
chương trình này; nếu không thì hãy viết thư cho Free Software Foundation,
Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA (Mỹ).
 Thử lệnh `%s %s' để tìm thấy thông tin thêm.
 UCS2   Nhớ   Mô tả

 Nếu chưa lập BỘ_KÝ_TỰ_MẶC_ĐỊNH trong môi trường thì LC_ALL, LC_CTYPE, LANG
quyết định biên mã phụ thuộc vào miền địa phương, là BỘ_KÝ_TỰ mặc định
 Chưa chấp nhận tên mặt `%s' Đã lập việc bỏ mặt hơn một lần cho `%s' Dữ liệu gõ không dịch được Hết bộ nhớ ảo rồì Hết bộ nhớ ảo rồi. Có thể sử dụng tùy chọn -k trước khi ghi danh sách bộ ký tự sau BỘ_KÝ_TỰ,
cả hai bộ ký tự ấy có dạng bảng, có mọi đôi dạng `BEF1:AFT1,BEF2:AFT2,...'
và cả hai BEF và AFT là mã dạng số thập phân.
 Tác giả: François Pinard <pinard@iro.umontreal.ca>.
 byte có thể hoàn tác ucs2 biến đổi 