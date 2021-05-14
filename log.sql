-- Keep a log of any SQL queries you execute as you solve the mystery.

--Ran this comand to find the detailed report of the theft
SELECT * FROM crime_scene_reports WHERE description LIKE "%theft%";

295 | 2020 | 7 | 28 | Chamberlin Street |
Theft of the CS50 duck took place at 10:15am at the
Chamberlin Street courthouse. Interviews were conducted
today with three witnesses who were present at the time —
each of their interview transcripts mentions the courthouse.

--ran thsi comand to find interview done on that day
SELECT * FROM interviews WHERE month = 7 AND day = 28 AND year = 2020;

161 | Ruth | 2020 | 7 | 28 |
Sometime within ten minutes of the theft,
I saw the thief get into a car in the courthouse parking lot and drive away.
If you have security footage from the courthouse parking lot,
you might want to look for cars that left the parking lot in that time frame.
162 | Eugene | 2020 | 7 | 28 | I don't know the thief's name,
but it was someone I recognized.
Earlier this morning, before I arrived at the courthouse,
I was walking by the ATM on Fifer Street and saw the thief there withdrawing some money.
163 | Raymond | 2020 | 7 | 28 | As the thief was leaving the courthouse,
they called someone who talked to them for less than a minute.
In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow.
The thief then asked the person on the other end of the phone to purchase the flight ticket.

--ran this code the try to find the licens plate
SELECT * FROM courthouse_security_logs WHERE hour= 10 AND month = 7 AND day = 28 AND year = 2020 AND minute BETWEEN 00 AND 30;
id | year | month | day | hour | minute | activity | license_plate
260 | 2020 | 7 | 28 | 10 | 16 | exit | 5P2BI95
261 | 2020 | 7 | 28 | 10 | 18 | exit | 94KL13X
262 | 2020 | 7 | 28 | 10 | 18 | exit | 6P58WS2
263 | 2020 | 7 | 28 | 10 | 19 | exit | 4328GD8
264 | 2020 | 7 | 28 | 10 | 20 | exit | G412CB7
265 | 2020 | 7 | 28 | 10 | 21 | exit | L93JTIZ
266 | 2020 | 7 | 28 | 10 | 23 | exit | 322W7JE
267 | 2020 | 7 | 28 | 10 | 23 | exit | 0NTHK55


--ran this to get information on the transaction done through the atm
SELECT * FROM atm_transactions WHERE atm_location LIKE "%fifer%" AND day = 28 AND year = 2020 AND month = 7;

id | account_number | year | month | day | atm_location | transaction_type | amount
246 | 28500762 | 2020 | 7 | 28 | Fifer Street | withdraw | 48
264 | 28296815 | 2020 | 7 | 28 | Fifer Street | withdraw | 20
266 | 76054385 | 2020 | 7 | 28 | Fifer Street | withdraw | 60
267 | 49610011 | 2020 | 7 | 28 | Fifer Street | withdraw | 50
269 | 16153065 | 2020 | 7 | 28 | Fifer Street | withdraw | 80
288 | 25506511 | 2020 | 7 | 28 | Fifer Street | withdraw | 20
313 | 81061156 | 2020 | 7 | 28 | Fifer Street | withdraw | 30
336 | 26013199 | 2020 | 7 | 28 | Fifer Street | withdraw | 35


--ran this comand to get account information
SELECT * FROM bank_accounts WHERE account_number = 28500762 OR account_number = 28296815 OR account_number = 76054385
OR account_number = 49610011 OR account_number = 16153065
OR account_number = 25506511 OR account_number = 81061156 OR account_number = 26013199;

account_number | person_id | creation_year
49610011 | 686048 | 2010
16153065 | 458378 | 2012
28296815 | 395717 | 2014
25506511 | 396669 | 2014
28500762 | 467400 | 2014
76054385 | 449774 | 2015
81061156 | 438727 | 2018



--ran this to get the airport id
SELECT * FROM airports;

id | abbreviation | full_name | city
1 | ORD | O'Hare International Airport | Chicago
2 | PEK | Beijing Capital International Airport | Beijing
3 | LAX | Los Angeles International Airport | Los Angeles
4 | LHR | Heathrow Airport | London
5 | DFS | Dallas/Fort Worth International Airport | Dallas
6 | BOS | Logan International Airport | Boston
7 | DXB | Dubai International Airport | Dubai
8 | CSF | Fiftyville Regional Airport | Fiftyville
9 | HND | Tokyo International Airport | Tokyo
10 | CDG | Charles de Gaulle Airport | Paris
11 | SFO | San Francisco International Airport | San Francisco
12 | DEL | Indira Gandhi International Airport | Delhi

--ran this to get the flight information
SELECT * FROM flights WHERE origin_airport_id = 8 AND month = 7 AND year = 2020 AND day = 29;
id | origin_airport_id | destination_airport_id | year | month | day | hour | minute
18 | 8 | 6 | 2020 | 7 | 29 | 16 | 0
23 | 8 | 11 | 2020 | 7 | 29 | 12 | 15
36 | 8 | 4 | 2020 | 7 | 29 | 8 | 20
43 | 8 | 1 | 2020 | 7 | 29 | 9 | 30
53 | 8 | 9 | 2020 | 7 | 29 | 15 | 20

--ran this to try in get more information on the person flighing
SELECT * FROM passengers WHERE flight_id = 36;

flight_id | passport_number | seat
36 | 7214083635 | 2A
36 | 1695452385 | 3B
36 | 5773159633 | 4A
36 | 1540955065 | 5C
36 | 8294398571 | 6C
36 | 1988161715 | 6D
36 | 9878712108 | 7A
36 | 8496433585 | 7B



--ran this to try to get more information on the caller
SELECT * FROM phone_calls WHERE month = 7 AND day = 28 AND year = 2020 AND duration < 60;
id | caller | receiver | year | month | day | duration
id | caller | receiver | year | month | day | duration
221 | (130) 555-0289 | (996) 555-8899 | 2020 | 7 | 28 | 51
224 | (499) 555-9472 | (892) 555-8872 | 2020 | 7 | 28 | 36
*233 | (367) 555-5533 | (375) 555-8161 | 2020 | 7 | 28 | 45
251 | (499) 555-9472 | (717) 555-1342 | 2020 | 7 | 28 | 50
254 | (286) 555-6063 | (676) 555-6554 | 2020 | 7 | 28 | 43
255 | (770) 555-1861 | (725) 555-3243 | 2020 | 7 | 28 | 49
261 | (031) 555-6622 | (910) 555-3251 | 2020 | 7 | 28 | 38
279 | (826) 555-1652 | (066) 555-9701 | 2020 | 7 | 28 | 55
281 | (338) 555-6650 | (704) 555-2131 | 2020 | 7 | 28 | 54


SELECT * FROM people WHERE license_plate = "5P2BI95" OR license_plate = "94KL13X" OR license_plate = "6P58WS2"
OR license_plate = "4328GD8" OR license_plate = "G412CB7"
OR license_plate = "L93JTIZ" OR license_plate = "322W7JE"
OR license_plate = "0NTHK55";

id | name | phone_number | passport_number | license_plate
398010 | Roger | (130) 555-0289 | 1695452385 | G412CB7
560886 | Evelyn | (499) 555-9472 | 8294398571 | 0NTHK55

SELECT * FROM people WHERE
passport_number = 7214083635 OR
passport_number = 1695452385 OR
passport_number = 5773159633 OR
passport_number = 1540955065 OR
passport_number = 8294398571 OR
passport_number = 1988161715 OR
passport_number = 9878712108 OR
passport_number = 8496433585;




id | name | phone_number | passport_number | license_plate
**395717 | Bobby | (826) 555-1652 | 9878712108 | 30G67EN
398010 | Roger | (130) 555-0289 | 1695452385 | G412CB7
**449774 | Madison | (286) 555-6063 | 1988161715 | 1106N58
560886 | Evelyn | (499) 555-9472 | 8294398571 | 0NTHK55
**686048 | Ernest | (367) 555-5533 | 5773159633 | 94KL13X
953679 | Doris | (066) 555-9701 | 7214083635 | M51FA04

SELECT * FROM people WHERE
id = 686048
OR id = 458378
OR id = 395717
OR id = 396669
OR id = 467400
OR id = 449774
OR id = 438727;


id | name | phone_number | passport_number | license_plate
395717 | Bobby | (826) 555-1652 | 9878712108 | 30G67EN
*396669 | Elizabeth | (829) 555-5269 | 7049073643 | L93JTIZ
438727 | Victoria | (338) 555-6650 | 9586786673 | 8X428L0
449774 | Madison | (286) 555-6063 | 1988161715 | 1106N58
458378 | Roy | (122) 555-4581 | 4408372428 | QX4YZN3
*467400 | Danielle | (389) 555-5198 | 8496433585 | 4328GD8
*686048 | Ernest | (367) 555-5533 | 5773159633 | 94KL13X

id | year | month | day | hour | minute | activity | license_plate

*261 | 2020 | 7 | 28 | 10 | 18 | exit | 94KL13X
*263 | 2020 | 7 | 28 | 10 | 19 | exit | 4328GD8
*265 | 2020 | 7 | 28 | 10 | 21 | exit | L93JTIZ

SELECT * FROM people;
id | name | phone_number | passport_number | license_plate
205082 | Pamela | (113) 555-7544 | 1050247273 | 5CIO816
210245 | Jordan | (328) 555-9658 | 7951366683 | HW0488P
210641 | Heather | (502) 555-6712 | 4356447308 | 
221103 | Patrick | (725) 555-4692 | 2963008352 | 5P2BI95
222194 | Ronald | (321) 555-6083 | 4959515588 | 9XPY28H
223936 | Natalie |  | 6627121233 | F494C29
225259 | Sean | (867) 555-9103 | 4377966420 | 
229076 | Aaron | (420) 555-5821 | 9852889341 | 
229572 | Bruce | (789) 555-8833 | 6216255522 | C3S4W87
230917 | Karen | (841) 555-3728 | 5031682798 | IH61GO8
231387 | Margaret | (068) 555-0183 | 1782675901 | 60563QT
233575 | Gabriel | (243) 555-7229 | 9747563214 | B49OR81
242207 | Louis | (749) 555-4874 | 5361280978 | 
243696 | Amber | (301) 555-4174 | 7526138472 | 6P58WS2
250185 | Abigail | (183) 555-7322 |  | Q98UB5W
250277 | James | (676) 555-6554 | 2438825627 | Q13SVG6
251693 | Larry | (892) 555-8872 | 2312901747 | O268ZZ0
253397 | Diana | (918) 555-2946 | 6131360461 | P743G7C
255860 | Virginia | (478) 555-1565 | 3866596772 | 
260099 | Austin |  | 5140313594 | P160306
265512 | Juan | (337) 555-9411 | 7020183712 | 8BB36NX
267176 | Cynthia | (458) 555-8396 | 2169423415 | 
271242 | Albert | (042) 555-1772 |  | 673020C
274388 | Laura | (067) 555-4133 | 1801324150 | 4406M71
274893 | Christina | (547) 555-8781 | 4322787338 | 79X5400
279793 | Cheryl | (450) 555-8297 |  | VWJ25E5
280744 | Eugene | (666) 555-5774 | 9584465633 | 47592FJ
282425 | Martha | (007) 555-2874 |  | O784M2U
293512 | Gerald |  | 8932594930 | X0Q6908
293753 | Ryan | (901) 555-8732 |  | 0WZS77X
313696 | Megan | (222) 555-8026 | 4879021885 | 
313837 | Tyler | (660) 555-3095 | 8613298074 | 3H26E71
315221 | Gregory | (022) 555-4052 | 3355598951 | V4C670D
316531 | Eric | (869) 555-6696 |  | X8T96JM
319800 | Jacob | (037) 555-8455 | 5584283945 | P45A66L
325548 | Brandon | (771) 555-6667 | 7874488539 | R3G7486
331126 | Brenda | (831) 555-0973 | 1139561952 | N7M42GP
331484 | Judy | (918) 555-5327 | 1236213682 | KGG82IR
336397 | Joan | (711) 555-3007 |  | L476K20
337221 | Christine | (608) 555-9302 |  | XE95071
341739 | Rebecca | (891) 555-5672 | 6264773605 | 
343408 | Grace | (932) 555-1504 | 9826028703 | HXA8903
343881 | Helen |  | 8810489487 | G3QW7I4
354903 | Marilyn | (568) 555-3190 | 7441135547 | 0R0FW39
358382 | Walter | (544) 555-8087 | 4223654265 | 82456Y8
360948 | Carolyn | (234) 555-1294 | 3925120216 | P14PE2Q
363991 | Christopher | (775) 555-7584 | 3249120117 | 91UQ3NC
368533 | Kayla | (487) 555-5865 | 4674590724 | 2729MD0
372684 | Alexander | (801) 555-9266 |  | 8P9NEU9
375525 | Noah | (959) 555-4871 | 1095374669 | 11J91FW
379932 | Joshua | (267) 555-2761 | 3761239013 | 1FBL6TH
384013 | Debra |  | 2750542732 | 47MEFVA
384637 | Kelly | (496) 555-2096 | 4041498045 | 
395717 | Bobby | (826) 555-1652 | 9878712108 | 30G67EN
396669 | Elizabeth | (829) 555-5269 | 7049073643 | L93JTIZ
398010 | Roger | (130) 555-0289 | 1695452385 | G412CB7
402368 | Lauren | (707) 555-7535 | 5551547908 | 3899SY4
404704 | Catherine | (020) 555-6715 |  | NA31S0K
419774 | Teresa | (041) 555-4011 | 8699553201 | HW0BF87
423393 | Carol | (168) 555-6126 | 6128131458 | 81MNC9R
430845 | Ruth | (772) 555-5770 |  | HZB4129
438727 | Victoria | (338) 555-6650 | 9586786673 | 8X428L0
440007 | Sara | (340) 555-8872 | 3412604728 | 99A843C
447494 | Dennis |  | 4149859587 | 
449774 | Madison | (286) 555-6063 | 1988161715 | 1106N58
458378 | Roy | (122) 555-4581 | 4408372428 | QX4YZN3
467400 | Danielle | (389) 555-5198 | 8496433585 | 4328GD8
477251 | Billy | (060) 555-2489 | 9290922261 | 2HB7G9N
484375 | Anna | (704) 555-2131 |  | 
485785 | Barbara | (367) 555-0409 | 1165086731 | HN8I106
486361 | Wayne | (056) 555-0309 |  | D965M59
490439 | Jesse | (693) 555-7986 |  | 608027W
495558 | Stephanie | (204) 555-4136 | 7712200330 | 2001OV9
502920 | Susan |  | 8623763125 | 
504758 | Samantha | (956) 555-1395 | 6720918005 | E9PF99X
505688 | Jean | (695) 555-0348 | 1682575122 | JN7K44M
506435 | Zachary | (839) 555-1757 |  | 5810O6V
514354 | Russell | (770) 555-1861 | 3592750733 | 322W7JE
518594 | Randy | (984) 555-5921 | 7538263720 | 106OW2W
520840 | Jeffrey |  | 2041495124 | EH6V12Q
526940 | Hannah | (877) 555-0523 | 3366196639 | 88CEO92
534459 | Olivia | (258) 555-5627 | 6632213958 | X273ZK9
537582 | Bradley | (873) 555-8470 | 1526109096 | 9Y0JT4U
539107 | Joseph | (238) 555-5554 | 4328444220 | 
539330 | Marie |  |  | C4559Y9
539960 | Theresa | (190) 555-4928 | 1833124350 | 668A8SL
542503 | Michael | (529) 555-7276 | 6117294637 | HOD8639
545303 | Nicholas | (095) 555-3639 | 2581746522 | 5840J5X
548858 | Kathleen | (960) 555-2044 | 2628207874 | PF37ZVK
559765 | William | (324) 555-0416 |  | FA63H32
560886 | Evelyn | (499) 555-9472 | 8294398571 | 0NTHK55
561160 | Kathryn | (609) 555-5876 | 6121106406 | 4ZY7I8T
565511 | Vincent |  | 3011089587 | 94MV71O
567218 | Jack | (996) 555-8899 | 9029462229 | 52R0Y8U
572028 | Paul | (357) 555-0246 | 9143726159 | R64E41W
579698 | Mary | (188) 555-4719 |  | C194752
580086 | Betty | (233) 555-0473 | 2400516856 | 47KK91C
585903 | Arthur | (394) 555-3247 | 7884829354 | 64I1286
586942 | Justin | (721) 555-1131 | 9608210024 | 
591369 | Dylan | (380) 555-4380 | 5776544886 | DN6Z7FH
600230 | Isabella |  | 9893853348 | 
600585 | Bryan | (696) 555-9195 | 3833243751 | 8911U63
604497 | Ralph | (771) 555-7880 | 6464352048 | 3933NUH
606219 | Jessica | (786) 555-5321 | 7118667746 | ET017P4
612949 | Benjamin | (680) 555-4935 |  | I8S932C
617509 | Jerry | (558) 555-9741 | 3816396248 | 4DD691O
619074 | Matthew |  | 4195341387 | 31GVT84
620295 | Janet | (464) 555-2162 | 2160709651 | P72XP87
620297 | Peter | (751) 555-6567 | 9224308981 | N507616
622544 | Joe | (452) 555-8550 |  | 24X1AQM
623724 | Julia |  | 5380305521 | L605IHS
626361 | Melissa | (717) 555-1342 | 7834357192 | 
630782 | Alexis | (814) 555-5180 | 5310124622 | X4G3938
632023 | Amanda | (821) 555-5262 | 1618186613 | RS7I6A0
634238 | Sandra | (604) 555-0153 |  | 2BDU20B
637069 | Michelle | (738) 555-2050 | 4590049635 | 52E25A9
639344 | Charlotte | (455) 555-5315 | 7226911797 | Z5FH038
650560 | Rose | (336) 555-0077 | 8909375052 | O7JQ1SA
651217 | Alan |  | 2884243902 | JUP02H1
651714 | Edward | (328) 555-1152 | 1540955065 | 130LD9Z
652398 | Carl | (704) 555-5790 | 7771405611 | 81MZ921
652412 | Denise | (994) 555-3373 | 4001449165 | NRYN856
658630 | Brittany | (398) 555-1013 |  | 6T124Q8
660982 | Thomas | (286) 555-0131 | 6034823042 | WD5M8I6
676919 | Steven | (195) 555-4173 | 1151340634 | 5VFD6G0
677560 | Samuel |  | 2180939853 | 10J5R8P
677698 | John | (016) 555-9166 | 8174538026 | 4468KVT
681821 | David | (260) 555-0610 | 8834222028 | SF5001S
682699 | Linda |  | 4120608613 | 
682850 | Ethan | (594) 555-6254 | 2996517496 | NAW9653
685894 | Donald | (971) 555-2231 |  | R964VP9
686048 | Ernest | (367) 555-5533 | 5773159633 | 94KL13X
692353 | Jonathan | (211) 555-3762 | 2047409662 | 7627B71
697106 | Henry | (645) 555-8082 | 3699913849 | 6590Q1M
704850 | Rachel | (006) 555-0505 |  | 7Z8B130
710572 | Richard |  | 7894166154 | 20Q418R
712712 | Jacqueline | (910) 555-3251 |  | 43V0R5D
713341 | Donna |  |  | 8LLB02B
717401 | Terry | (730) 555-5115 | 3564659888 | 5209A97
718152 | Jason | (636) 555-4198 | 2818150870 | 8666X39
719061 | Ashley | (770) 555-1196 | 1038053449 | 
720244 | Dorothy | (047) 555-0577 | 9135709773 | 7T807V5
730171 | Ann | (601) 555-6795 | 4215752756 | 84869TJ
734908 | Maria | (492) 555-5484 |  | 3N39WQN
743806 | Sharon | (343) 555-0167 | 9687940003 | 9N79I17
745650 | Sophia | (027) 555-1068 | 3642612721 | 13FNH73
747078 | Judith |  | 8284363264 | 4963D92
748674 | Jeremy | (194) 555-5027 | 1207566299 | V47T75I
750165 | Daniel | (971) 555-6468 | 7597790505 | FLFN3W0
753885 | Jennifer | (911) 555-0229 | 7378796210 | 1K44SN8
754943 | Nathan | (293) 555-1469 | 8914039923 | 11WB3I6
757606 | Douglas | (491) 555-2505 | 3231999695 | 1FW4EUJ
762248 | Kyle | (035) 555-2997 |  | 2M2Y681
764352 | Scott | (801) 555-8906 | 6264781665 | 68K1239
764823 | Keith | (209) 555-7806 | 9698118788 | 630U2R7
768035 | Diane | (147) 555-6818 | 6099879058 | WR2G758
768248 | George |  | 4977790793 | L68E5I0
769190 | Charles | (427) 555-0556 | 3915621712 | R12SA4D
779942 | Harold | (669) 555-6918 |  | DVS39US
780088 | Nicole | (123) 555-5144 | 3835860232 | 91S1K32
788213 | Emily | (406) 555-4440 | 6263461050 | Y340743
788911 | Gloria | (973) 555-3809 | 2835165196 | O010420
795190 | Frances | (059) 555-4698 | 5138876283 | 97O6H62
801296 | Anthony |  | 8639149598 | 50U175Y
804716 | Kevin | (618) 555-9856 |  | QDS31M6
809194 | Alice | (031) 555-9915 | 1679711307 | 1M92998
809265 | Jose | (914) 555-5994 | 9183348466 | 
810563 | Gary |  | 6038029185 | S5EI3B0
818095 | Patricia | (594) 555-2863 | 5806941094 | R059OD5
821978 | Beverly | (342) 555-9260 | 2793107431 | 
828675 | Nancy | (998) 555-1979 | 7021171868 | 878Z799
832111 | Emma | (329) 555-5870 | 7968707324 | 1628C65
834626 | Shirley |  | 4754635619 | 3S8505X
837455 | Andrew | (579) 555-5030 |  | W2CT78U
847116 | Philip | (725) 555-3243 | 3391710505 | GW362R6
850016 | Mark | (873) 555-3868 | 4631067354 | YD7376W
857325 | Timothy | (962) 555-5827 | 7178034193 | 3AML2V7
864400 | Berthold | (375) 555-8161 |  | 4V16VO0
872102 | Joyce |  | 7179245843 | 594IBK6
893762 | Janice | (033) 555-9033 |  | 61226BT
907148 | Kimberly | (031) 555-6622 | 9628244268 | Q12B3Z3
910162 | Brian | (636) 555-3370 | 2329158653 | Y46HW88
912825 | Katherine |  |  | 
920334 | Stephen | (247) 555-7205 |  | 99N25L1
926715 | Frank | (356) 555-6641 | 8336437534 | 207W38T
929343 | Andrea | (368) 555-3561 | 7954314541 | 245THL6
937274 | Raymond | (125) 555-8030 |  | Y18DLY3
948985 | Robert | (098) 555-1164 | 8304650265 | I449449
952462 | Christian |  | 2626335085 | 6CV51G1
953420 | Amy | (670) 555-8598 | 9355133130 | 
953679 | Doris | (066) 555-9701 | 7214083635 | M51FA04
955017 | Sarah | (505) 555-5698 | 9172951504 | 47602K4
962494 | Johnny | (117) 555-6630 | 7918203533 | 3JC5R39
966408 | Adam |  |  | FQUFJ16
969163 | Willie | (741) 555-1748 | 4158550933 | 
975354 | Logan | (219) 555-0139 | 9692634019 | 6866W0M
985497 | Deborah | (344) 555-9601 | 8714200946 | 10I5658
985539 | Lisa | (118) 555-8106 |  | B3VSJVF
992589 | Lawrence |  | 2290269570 | TWA51P1
994229 | Angela | (310) 555-8568 | 9920757687 | SS458D7
