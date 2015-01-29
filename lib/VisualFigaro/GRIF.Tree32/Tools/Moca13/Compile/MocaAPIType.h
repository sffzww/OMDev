#ifndef __MOCA_API_TYPE_H__
# define __MOCA_API_TYPE_H__

#include <float.h>

/**
<!DOCTYPE section [
<!ENTITY % DefineEntity SYSTEM "Define.entity">
%DefineEntity;
]>

<section id="Moca.Moca13.API.Type">
<title>Déclaration des différents types gérés par l'API</title>
*/


//-----------------------------------------------------------------------

/**
<section id="Moca.Moca13.API.Type.Data">
<title>Types associés à des données/objets</title>
<para>
*/

typedef struct mapi_shell mapi_shell;
/**
<funcsynopsis id="Moca.Moca13.API.Type.mapi_shell">
	<funcprototype>
	  <funcdef> <function>mapi_shell</function></funcdef>
	</funcprototype>
	<funcsynopsisinfo>
		Type abstrait représentant l'interpréteur de commandes de &MOK_NAME;. 
	</funcsynopsisinfo>
</funcsynopsis>
 */

typedef struct mapi_net mapi_net;
/**
<funcsynopsis id="Moca.Moca13.API.Type.mapi_net">
	<funcprototype>
	  <funcdef> <function>mapi_net</function></funcdef>
	</funcprototype>
	<funcsynopsisinfo>
		Type abstrait représentant un réseau de Petri.
	</funcsynopsisinfo>
</funcsynopsis>
 */

typedef struct mapi_transition mapi_transition;
/**
<funcsynopsis id="Moca.Moca13.API.Type.mapi_transition">
	<funcprototype>
	  <funcdef> <function>mapi_transition</function></funcdef>
	</funcprototype>
	<funcsynopsisinfo>
		Type abstrait représentant une transition du réseau de Petri.
	</funcsynopsisinfo>
</funcsynopsis>
 */

typedef struct mapi_expression mapi_expression;
/**
<funcsynopsis id="Moca.Moca13.API.Type.mapi_expression">
	<funcprototype>
	  <funcdef> <function>mapi_expression</function></funcdef>
	</funcprototype>
	<funcsynopsisinfo>
		Type abstrait représentant une expression du réseau de Petri.
	</funcsynopsisinfo>
</funcsynopsis>
 */

typedef struct mapi_table mapi_table;
/**
<funcsynopsis id="Moca.Moca13.API.Type.mapi_table">
	<funcprototype>
	  <funcdef> <function>mapi_table</function></funcdef>
	</funcprototype>
	<funcsynopsisinfo>
		Type abstrait représentant un tableau du réseau de Petri.
	</funcsynopsisinfo>
</funcsynopsis>
 */

typedef int mapi_external_id, mapi_internal_id;
/**
<funcsynopsis id="Moca.Moca13.API.Type.mapi_external">
	<funcprototype>
	  <funcdef> <function>mapi_external_id, mapi_internal_id</function></funcdef>
	</funcprototype>
	<funcsynopsisinfo>
	<para>
		Ces types représentent respectivement les numérotations 
	  internes et externes des places du réseau de Petri. Dans
	  la mesure ou les places peuvent avoir des numéros de 
	  description non consécutifs, &MOK_NAME; les renumérote en interne.
	</para>
	<para>
	  L'obtention des informations relatives aux places s'effectue
	  via la numérotation interne (mapi_internal_id).
	  Le module client a la possibilité de récupérer le numéro interne 
	  d'une place en fonction de son numéro externe (celui de la description)
	  via la fonction mapi_get_place_internal_ident 
	</para>
 	</funcsynopsisinfo>
</funcsynopsis>
 */

typedef long double mapi_double;
/**
<funcsynopsis id="Moca.Moca13.API.Type.mapi_double">
	<funcprototype>
	  <funcdef> <function>mapi_double</function></funcdef>
	</funcprototype>
	<funcsynopsisinfo>
	Type des nombres réels utilisés par &MOK_NAME;. Ce type défini
  la précision de nombres en virgules flottantes. 
  A priori le module client de l'API &MOK_NAME; doit utiliser ce type 
  lors de ses calculs.
	</funcsynopsisinfo>
</funcsynopsis>
 */

#define mapi_NaN ((mapi_double)DBL_MIN)
/**
<funcsynopsis id="Moca.Moca13.API.Type.mapi_NaN">
	<funcprototype>
	  <funcdef> <function>mapi_NaN</function></funcdef>
	</funcprototype>
	<funcsynopsisinfo>
		Valeur abstraite d'un nombre en virgule flottante erroné
		(division par zéro, ...)
	</funcsynopsisinfo>
</funcsynopsis>
 */

/**
</para>
</section>
*/

//-----------------------------------------------------------------------

/**
<section id="Moca.Moca13.API.Type.FctxFct">
<title>Prototype de fonctions associées aux fonctions externes</title>
<para>
*/

typedef mapi_double mapi_special_funct_proc(
            mapi_net *net, int nb_arguments, mapi_double *arguments);
/**
<funcsynopsis id="Moca.Moca13.API.Type.mapi_special_funct_proc">
	<funcprototype>
	  <funcdef><link linkend="Moca.Moca13.API.Type.mapi_double">mapi_double</link> 
	    <function>mapi_special_funct_proc</function></funcdef>
    <paramdef><link linkend="Moca.Moca13.API.Type.mapi_net">mapi_net</link> *<parameter>net</parameter></paramdef>
    <paramdef>int <parameter>nb_arguments</parameter></paramdef>
    <paramdef><link linkend="Moca.Moca13.API.Type.mapi_double">mapi_double</link> *
    	<parameter>arguments</parameter></paramdef>
	</funcprototype>
	<funcsynopsisinfo>
	<para>
		Prototype des fonctions de calcul des fonctions externes 
    définies par routines C.
	</para><para>
	  Ces fonctions reçoivent en argument le réseau de Petri en cours 
	  de simulation <parameter>net</parameter>. 
	</para><para>
	  Les arguments de la fonction externe considérée sont donnés 
    dans le tableau <parameter>arguments</parameter> qui contient 
	  <parameter>nb_arguments</parameter> nombre réels. 
    Le type des arguments a été validé en fonction de la signature
    de la fonction externe.
	</para><para>
		la valeur renvoyée est éventuellement modifiée en fonction
    de la signature, puis utilisée au sein de Moca comme résultat
    de l'expression.
	</para>
  </funcsynopsisinfo>
</funcsynopsis>
 */

/**
</para>
</section>
*/

//-----------------------------------------------------------------------

/**
<section id="Moca.Moca13.API.Type.FctDelay">
<title>Prototype de fonctions associées aux lois de délai</title>
<para>
*/

typedef int mapi_special_law_init_proc(
            mapi_net *net, mapi_transition *T, int number);
/**
<funcsynopsis id="Moca.Moca13.API.Type.mapi_special_law_init_proc">
	<funcprototype>
	  <funcdef>int <function>mapi_special_law_init_proc</function></funcdef>
    <paramdef><link linkend="Moca.Moca13.API.Type.mapi_net">mapi_net</link> *<parameter>net</parameter></paramdef>
    <paramdef><link linkend="Moca.Moca13.API.Type.mapi_transition">mapi_transition</link> *
    	<parameter>T</parameter></paramdef>
    <paramdef>int <parameter>number</parameter></paramdef>
	</funcprototype>
	<funcsynopsisinfo>
	<para>
		Prototype des fonctions d'initialisation des <emphasis>lois de délai</emphasis>
	  définies par routines C. 
	</para><para>
	  Ces fonctions ont en charge l'initialisation des
	  données du client pour la loi numéro <parameter>number</parameter> 
	  associée à la transition <parameter>T</parameter>
	  du réseau de Petri <parameter>net</parameter>.	
	</para>
  </funcsynopsisinfo>
</funcsynopsis>
 */

typedef int mapi_special_law_verif_proc(
            mapi_net *net, mapi_transition *T, int number, 
            int nb_arguments, mapi_double *arguments, 
            char **mess, int *code);
/**
<funcsynopsis id="Moca.Moca13.API.Type.mapi_special_law_verif_proc">
	<funcprototype>
	  <funcdef>int <function>mapi_special_law_verif_proc</function></funcdef>
    <paramdef><link linkend="Moca.Moca13.API.Type.mapi_net">mapi_net</link> *
    	<parameter>net</parameter></paramdef>
    <paramdef><link linkend="Moca.Moca13.API.Type.mapi_transition">mapi_transition</link> *
    	<parameter>T</parameter></paramdef>
    <paramdef>int <parameter>number</parameter></paramdef>
    <paramdef>int <parameter>nb_arguments</parameter></paramdef>
    <paramdef><link linkend="Moca.Moca13.API.Type.mapi_double">mapi_double</link> *
    	<parameter>arguments</parameter></paramdef>
    <paramdef>char **<parameter>mess</parameter></paramdef>
    <paramdef>int *<parameter>code</parameter></paramdef>
	</funcprototype>
	<funcsynopsisinfo>
	<para>
		Prototype des fonctions de vérification des <emphasis>lois de délai</emphasis>
	  définies par routines C. 
	</para><para>
	  Ces fonctions ont en charge la vérification des données du client 
	  pour la loi numéro <parameter>number</parameter> associée à la transition 
	  <parameter>T</parameter> du réseau de Petri <parameter>net</parameter>. 
	  Les arguments de la loi considérée sont donnés dans le tableau 
	  <parameter>arguments</parameter> qui contient 
	  <parameter>nb_arguments</parameter> nombre réels. 
	</para><para>
	  Ces fonctions retournent 0 si il n'y a pas de problème, 
	  1 si les paramètres engendre une erreur irrécupérable, 
	  2 si l'erreur est de type avertissement.
	</para><para>
	  Dans le cas d'une erreur, ces fonctions doivent modifier les 
	  paramètres <parameter>mess</parameter> et <parameter>code</parameter> 
	  afin respectivement d'afficher de manière explicite le message d'erreur 
	  et de retourner un code d'erreur via.
	</para>
  </funcsynopsisinfo>
</funcsynopsis>
 */

typedef mapi_double mapi_special_law_delay_proc(
            mapi_net *net, mapi_transition *T, int number, 
            int nb_arguments, mapi_double *arguments);
/**
<funcsynopsis id="Moca.Moca13.API.Type.mapi_special_law_delay_proc">
	<funcprototype>
	  <funcdef><link linkend="Moca.Moca13.API.Type.mapi_double">mapi_double</link> 
	    <function>mapi_special_law_delay_proc</function></funcdef>
    <paramdef><link linkend="Moca.Moca13.API.Type.mapi_net">mapi_net</link> *<parameter>net</parameter></paramdef>
    <paramdef><link linkend="Moca.Moca13.API.Type.mapi_transition">mapi_transition</link> *
    	<parameter>T</parameter></paramdef>
    <paramdef>int <parameter>number</parameter></paramdef>
    <paramdef>int <parameter>nb_arguments</parameter></paramdef>
    <paramdef><link linkend="Moca.Moca13.API.Type.mapi_double">mapi_double</link> *
    	<parameter>arguments</parameter></paramdef>
	</funcprototype>
	<funcsynopsisinfo>
	<para>
		Prototype des fonctions de calcul de délai pour les
  	lois de délai définies par routines C.
	</para><para>
	  Ces fonctions reçoivent en argument le réseau de Petri en cours 
	  de simulation <parameter>net</parameter>, la transition 
	  <parameter>T</parameter> dont on désire connaître le délai avant tir, 
	  le numéro <parameter>number</parameter> de la loi spéciale 
	  considérée associé à la transition. 
	</para><para>
	  Les arguments de la loi considérée sont donnés dans le tableau 
	  <parameter>arguments</parameter> qui contient 
	  <parameter>nb_arguments</parameter> nombre réels. 
	  Ces arguments ont été vérifiés au préalable.
	</para><para>
		La fonction doit renvoyer le délai entre l'instant de validation
		de la transition et l'instant de tir de la transition.
	</para>
  </funcsynopsisinfo>
</funcsynopsis>
 */

/**
</para>
</section>
*/

//-----------------------------------------------------------------------

/**
<section id="Moca.Moca13.API.Type.FctFire">
<title>Prototype de fonctions associées aux lois de tir</title>
<para>
*/

typedef int mapi_special_fire_init_proc(
            mapi_net *net, mapi_transition *T, int number);
/**
<funcsynopsis id="Moca.Moca13.API.Type.mapi_special_fire_init_proc">
	<funcprototype>
	  <funcdef>int <function>mapi_special_<emphasis>fire</emphasis>_init_proc</function></funcdef>
    <paramdef><link linkend="Moca.Moca13.API.Type.mapi_net">mapi_net</link> *<parameter>net</parameter></paramdef>
    <paramdef><link linkend="Moca.Moca13.API.Type.mapi_transition">mapi_transition</link> *
    	<parameter>T</parameter></paramdef>
    <paramdef>int <parameter>number</parameter></paramdef>
	</funcprototype>
	<funcsynopsisinfo>
	<para>
		Prototype des fonctions d'initialisation des <emphasis>lois de tir</emphasis>
	  définies par routines C. 
	</para><para>
	  Cette fonction a en charge l'initialisation des
	  données du client pour la loi numéro <parameter>number</parameter> 
	  associée à la transition <parameter>T</parameter>
	  du réseau de Petri <parameter>net</parameter>.	
	</para>
  </funcsynopsisinfo>
</funcsynopsis>
 */

typedef int mapi_special_fire_verif_proc(
            mapi_net *net, mapi_transition *T, int number, 
            int nb_arguments, mapi_double *arguments, 
            char **mess, int *code);
/**
<funcsynopsis id="Moca.Moca13.API.Type.mapi_special_fire_verif_proc">
	<funcprototype>
	  <funcdef>int <function>mapi_special_<emphasis>fire</emphasis>_verif_proc</function></funcdef>
    <paramdef><link linkend="Moca.Moca13.API.Type.mapi_net">mapi_net</link> *<parameter>net</parameter></paramdef>
    <paramdef><link linkend="Moca.Moca13.API.Type.mapi_transition">mapi_transition</link> *
    	<parameter>T</parameter></paramdef>
    <paramdef>int <parameter>number</parameter></paramdef>
    <paramdef>int <parameter>nb_arguments</parameter></paramdef>
    <paramdef><link linkend="Moca.Moca13.API.Type.mapi_double">mapi_double</link> *
    	<parameter>arguments</parameter></paramdef>
    <paramdef>char **<parameter>mess</parameter></paramdef>
    <paramdef>int *<parameter>code</parameter></paramdef>
	</funcprototype>
	<funcsynopsisinfo>
	<para>
		Prototype des fonctions de vérification des <emphasis>lois de tir</emphasis>
	  définies par routines C. 
	</para><para>
	  Ces fonctions ont en charge la vérification des données du client 
	  pour la loi numéro <parameter>number</parameter> associée à la transition 
	  <parameter>T</parameter> du réseau de Petri <parameter>net</parameter>. 
	  Les arguments de la loi considérée sont donnés dans le tableau 
	  <parameter>arguments</parameter> qui contient 
	  <parameter>nb_arguments</parameter> nombre réels. 
	</para><para>
	  Ces fonctions retournent 0 si il n'y a pas de problème, 
	  1 si les paramètres engendre une erreur irrécupérable, 
	  2 si l'erreur est de type avertissement.
	</para><para>
	  Dans le cas d'une erreur, ces fonctions doivent modifier les 
	  paramètres <parameter>mess</parameter> et <parameter>code</parameter> 
	  afin respectivement d'afficher de manière explicite le message d'erreur 
	  et de retourner un code d'erreur via.
	</para>
  </funcsynopsisinfo>
</funcsynopsis>
 */

typedef void mapi_special_fire_valid_proc(
            mapi_net *net, mapi_transition *T, int number);
/**
<funcsynopsis id="Moca.Moca13.API.Type.mapi_special_fire_valid_proc">
	<funcprototype>
	  <funcdef>int <function>mapi_special_<emphasis>fire</emphasis>_valid_proc</function></funcdef>
    <paramdef><link linkend="Moca.Moca13.API.Type.mapi_net">mapi_net</link> *<parameter>net</parameter></paramdef>
    <paramdef><link linkend="Moca.Moca13.API.Type.mapi_transition">mapi_transition</link> *
    	<parameter>T</parameter></paramdef>
    <paramdef>int <parameter>number</parameter></paramdef>
	</funcprototype>
	<funcsynopsisinfo>
	<para>
		Prototype des fonctions de validation des <emphasis>lois de tir</emphasis>
  	définies par routines C.
 	</para><para>
	  Ces fonctions sont appelées au moment de la validation d'une transition.
	  Elles permettent la mémorisation d'informations à cet instant
	  (comme le temps courant ou un nombre aléatoire).	
	</para>
  </funcsynopsisinfo>
</funcsynopsis>
 */

typedef void mapi_special_fire_trigger_proc(
            mapi_net *net, mapi_transition *T, int number, 
            int nb_arguments, mapi_double *arguments);
/**
<funcsynopsis id="Moca.Moca13.API.Type.mapi_special_fire_trigger_proc">
	<funcprototype>
	  <funcdef><link linkend="Moca.Moca13.API.Type.mapi_double">mapi_double</link> 
	    <function>mapi_special_fire_trigger_proc</function></funcdef>
    <paramdef><link linkend="Moca.Moca13.API.Type.mapi_net">mapi_net</link> *<parameter>net</parameter></paramdef>
    <paramdef><link linkend="Moca.Moca13.API.Type.mapi_transition">mapi_transition</link> *
    	<parameter>T</parameter></paramdef>
    <paramdef>int <parameter>number</parameter></paramdef>
    <paramdef>int <parameter>nb_arguments</parameter></paramdef>
    <paramdef><link linkend="Moca.Moca13.API.Type.mapi_double">mapi_double</link> *
    	<parameter>arguments</parameter></paramdef>
	</funcprototype>
	<funcsynopsisinfo>
	<para>
		Prototype des fonctions de tir pour les <emphasis>lois de tir</emphasis>
		définies par routines C.
	</para><para>
	  Ces fonctions reçoivent en argument le réseau de Petri en cours 
	  de simulation <parameter>net</parameter>, la transition 
	  <parameter>T</parameter> à tirer, le numéro <parameter>number</parameter> 
	  de la loi spéciale associé à la transition. 
	</para><para>
	  Les arguments de la loi sont donnés dans le tableau 
	  <parameter>arguments</parameter> qui contient 
	  <parameter>nb_arguments</parameter> nombre réels. 
	  Ces arguments ont été vérifiés au préalable.
	</para><para>
		La fonction doit effectuer réellement le tir de la transition.
	</para>
  </funcsynopsisinfo>
</funcsynopsis>
 */

/**
</para>
</section>
*/

//-----------------------------------------------------------------------

/**
</section>
*/

#endif /* __MOCA_API_TYPE_H__ */

