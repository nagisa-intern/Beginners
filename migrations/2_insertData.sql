-- +migrate Up

ALTER TABLE beginners.comic_data ADD page INT NOT NULL DEFAULT 0 COMMENT 'ページ数';

UPDATE beginners.comic_data SET page='36' WHERE id='1';

UPDATE beginners.comic_data SET page='20' WHERE id='2';

UPDATE beginners.comic_data SET page='20' WHERE id='3';

UPDATE beginners.comic_data SET page='22' WHERE id='4';

UPDATE beginners.comic_data SET page='26' WHERE id='5';

UPDATE beginners.comic_data SET page='22' WHERE id='6';

UPDATE beginners.comic_data SET page='22' WHERE id='7';

UPDATE beginners.comic_data SET page='24' WHERE id='8';

UPDATE beginners.comic_data SET page='18' WHERE id='9';

UPDATE beginners.comic_data SET page='22' WHERE id='10';

UPDATE beginners.comic_data SET page='21' WHERE id='11';

UPDATE beginners.comic_data SET page='24' WHERE id='12';

UPDATE beginners.comic_data SET page='18' WHERE id='13';

UPDATE beginners.comic_data SET page='16' WHERE id='14';

UPDATE beginners.comic_data SET page='18' WHERE id='15';

UPDATE beginners.comic_data SET page='18' WHERE id='16';

UPDATE beginners.comic_data SET page='18' WHERE id='17';

UPDATE beginners.comic_data SET page='16' WHERE id='18';

UPDATE beginners.comic_data SET page='18' WHERE id='19';

UPDATE beginners.comic_data SET page='24' WHERE id='20';

UPDATE beginners.comic_data SET page='18' WHERE id='21';

UPDATE beginners.comic_data SET page='30' WHERE id='22';

UPDATE beginners.comic_data SET page='20' WHERE id='23';

UPDATE beginners.comic_data SET page='24' WHERE id='24';

UPDATE beginners.comic_data SET page='22' WHERE id='25';

UPDATE beginners.comic_data SET page='6' WHERE id='26';

UPDATE beginners.comic_data SET page='24' WHERE id='27';

UPDATE beginners.comic_data SET page='20' WHERE id='28';

UPDATE beginners.comic_data SET page='20' WHERE id='29';

UPDATE beginners.comic_data SET page='22' WHERE id='30';

UPDATE beginners.comic_data SET page='22' WHERE id='31';

UPDATE beginners.comic_data SET page='24' WHERE id='32';

UPDATE beginners.comic_data SET page='28' WHERE id='33';

UPDATE beginners.comic_data SET page='28' WHERE id='34';

UPDATE beginners.comic_data SET page='28' WHERE id='35';

UPDATE beginners.comic_data SET page='26' WHERE id='36';

UPDATE beginners.comic_data SET page='22' WHERE id='37';

UPDATE beginners.comic_data SET page='24' WHERE id='38';

UPDATE beginners.comic_data SET page='22' WHERE id='39';

UPDATE beginners.comic_data SET page='20' WHERE id='40';

UPDATE beginners.comic_data SET page='20' WHERE id='41';

UPDATE beginners.comic_data SET page='22' WHERE id='42';

UPDATE beginners.comic_data SET page='20' WHERE id='43';

UPDATE beginners.comic_data SET page='20' WHERE id='44';

UPDATE beginners.comic_data SET page='18' WHERE id='45';

UPDATE beginners.comic_data SET page='16' WHERE id='46';

UPDATE beginners.comic_data SET page='16' WHERE id='47';

UPDATE beginners.comic_data SET page='22' WHERE id='48';

UPDATE beginners.comic_data SET page='22' WHERE id='49';

UPDATE beginners.comic_data SET page='19' WHERE id='50';

UPDATE beginners.comic_data SET page='24' WHERE id='51';

UPDATE beginners.comic_data SET page='20' WHERE id='52';

UPDATE beginners.comic_data SET page='18' WHERE id='53';

UPDATE beginners.comic_data SET page='28' WHERE id='54';

UPDATE beginners.comic_data SET page='18' WHERE id='55';

UPDATE beginners.comic_data SET page='18' WHERE id='56';

UPDATE beginners.comic_data SET page='18' WHERE id='57';

UPDATE beginners.comic_data SET page='18' WHERE id='58';

UPDATE beginners.comic_data SET page='22' WHERE id='59';

UPDATE beginners.comic_data SET page='20' WHERE id='60';

UPDATE beginners.comic_data SET page='18' WHERE id='61';

UPDATE beginners.comic_data SET page='18' WHERE id='62';

UPDATE beginners.comic_data SET page='22' WHERE id='63';

UPDATE beginners.comic_data SET page='20' WHERE id='64';

UPDATE beginners.comic_data SET page='20' WHERE id='65';

UPDATE beginners.comic_data SET page='18' WHERE id='66';

UPDATE beginners.comic_data SET page='20' WHERE id='67';

UPDATE beginners.comic_data SET page='20' WHERE id='68';

UPDATE beginners.comic_data SET page='26' WHERE id='69';

UPDATE beginners.comic_data SET page='22' WHERE id='70';

UPDATE beginners.comic_data SET page='30' WHERE id='71';

UPDATE beginners.comic_data SET page='22' WHERE id='72';

UPDATE beginners.comic_data SET page='26' WHERE id='73';

UPDATE beginners.comic_data SET page='28' WHERE id='74';

UPDATE beginners.comic_data SET page='28' WHERE id='75';

UPDATE beginners.comic_data SET page='26' WHERE id='76';

UPDATE beginners.comic_data SET page='26' WHERE id='77';

UPDATE beginners.comic_data SET page='28' WHERE id='78';

UPDATE beginners.comic_data SET page='28' WHERE id='79';

UPDATE beginners.comic_data SET page='30' WHERE id='80';

UPDATE beginners.comic_data SET page='18' WHERE id='81';

UPDATE beginners.comic_data SET page='28' WHERE id='82';

UPDATE beginners.comic_data SET page='20' WHERE id='83';

UPDATE beginners.comic_data SET page='22' WHERE id='84';

UPDATE beginners.comic_data SET page='28' WHERE id='85';

UPDATE beginners.comic_data SET page='22' WHERE id='86';

UPDATE beginners.comic_data SET page='24' WHERE id='87';

UPDATE beginners.comic_data SET page='30' WHERE id='88';

UPDATE beginners.comic_data SET page='24' WHERE id='89';

UPDATE beginners.comic_data SET page='28' WHERE id='90';

UPDATE beginners.comic_data SET page='24' WHERE id='91';

UPDATE beginners.comic_data SET page='24' WHERE id='92';

UPDATE beginners.comic_data SET page='24' WHERE id='93';

UPDATE beginners.comic_data SET page='24' WHERE id='94';

UPDATE beginners.comic_data SET page='28' WHERE id='95';

UPDATE beginners.comic_data SET page='8' WHERE id='96';

UPDATE beginners.comic_data SET page='22' WHERE id='97';

UPDATE beginners.comic_data SET page='18' WHERE id='98';

UPDATE beginners.comic_data SET page='22' WHERE id='99';

UPDATE beginners.comic_data SET page='24' WHERE id='100';

UPDATE beginners.comic_data SET page='22' WHERE id='101';

UPDATE beginners.comic_data SET page='10' WHERE id='102';

UPDATE beginners.comic_data SET page='22' WHERE id='103';

UPDATE beginners.comic_data SET page='32' WHERE id='104';

UPDATE beginners.comic_data SET page='24' WHERE id='105';

UPDATE beginners.comic_data SET page='26' WHERE id='106';

UPDATE beginners.comic_data SET page='26' WHERE id='107';

UPDATE beginners.comic_data SET page='26' WHERE id='108';

UPDATE beginners.comic_data SET page='24' WHERE id='109';

UPDATE beginners.comic_data SET page='24' WHERE id='110';

UPDATE beginners.comic_data SET page='24' WHERE id='111';

UPDATE beginners.comic_data SET page='24' WHERE id='112';

UPDATE beginners.comic_data SET page='26' WHERE id='113';

UPDATE beginners.comic_data SET page='24' WHERE id='114';

UPDATE beginners.comic_data SET page='26' WHERE id='115';

UPDATE beginners.comic_data SET page='28' WHERE id='116';

UPDATE beginners.comic_data SET page='30' WHERE id='117';

UPDATE beginners.comic_data SET page='8' WHERE id='118';

UPDATE beginners.comic_data SET page='14' WHERE id='119';

UPDATE beginners.comic_data SET page='8' WHERE id='120';

UPDATE beginners.comic_data SET page='8' WHERE id='121';

UPDATE beginners.comic_data SET page='8' WHERE id='122';

UPDATE beginners.comic_data SET page='8' WHERE id='123';

UPDATE beginners.comic_data SET page='8' WHERE id='124';

UPDATE beginners.comic_data SET page='8' WHERE id='125';

UPDATE beginners.comic_data SET page='8' WHERE id='126';

UPDATE beginners.comic_data SET page='8' WHERE id='127';

UPDATE beginners.comic_data SET page='8' WHERE id='128';

UPDATE beginners.comic_data SET page='8' WHERE id='129';

UPDATE beginners.comic_data SET page='8' WHERE id='130';

UPDATE beginners.comic_data SET page='8' WHERE id='131';

UPDATE beginners.comic_data SET page='8' WHERE id='132';

UPDATE beginners.comic_data SET page='8' WHERE id='133';

UPDATE beginners.comic_data SET page='8' WHERE id='134';

UPDATE beginners.comic_data SET page='8' WHERE id='135';

UPDATE beginners.comic_data SET page='8' WHERE id='136';

UPDATE beginners.comic_data SET page='8' WHERE id='137';

UPDATE beginners.comic_data SET page='8' WHERE id='138';

UPDATE beginners.comic_data SET page='8' WHERE id='139';

UPDATE beginners.comic_data SET page='8' WHERE id='140';

UPDATE beginners.comic_data SET page='8' WHERE id='141';

UPDATE beginners.comic_data SET page='8' WHERE id='142';

UPDATE beginners.comic_data SET page='8' WHERE id='143';

UPDATE beginners.comic_data SET page='8' WHERE id='144';

UPDATE beginners.comic_data SET page='8' WHERE id='145';

UPDATE beginners.comic_data SET page='8' WHERE id='146';

UPDATE beginners.comic_data SET page='30' WHERE id='147';

UPDATE beginners.comic_data SET page='30' WHERE id='148';

UPDATE beginners.comic_data SET page='18' WHERE id='149';

UPDATE beginners.comic_data SET page='20' WHERE id='150';

UPDATE beginners.comic_data SET page='30' WHERE id='151';

UPDATE beginners.comic_data SET page='37' WHERE id='152';

UPDATE beginners.comic_data SET page='19' WHERE id='153';

UPDATE beginners.comic_data SET page='19' WHERE id='154';

UPDATE beginners.comic_data SET page='19' WHERE id='155';

UPDATE beginners.comic_data SET page='19' WHERE id='156';

UPDATE beginners.comic_data SET page='19' WHERE id='157';

UPDATE beginners.comic_data SET page='19' WHERE id='158';

UPDATE beginners.comic_data SET page='19' WHERE id='159';

UPDATE beginners.comic_data SET page='60' WHERE id='160';

UPDATE beginners.comic_data SET page='30' WHERE id='161';

UPDATE beginners.comic_data SET page='24' WHERE id='162';

UPDATE beginners.comic_data SET page='28' WHERE id='163';

UPDATE beginners.comic_data SET page='30' WHERE id='164';

UPDATE beginners.comic_data SET page='30' WHERE id='165';

UPDATE beginners.comic_data SET page='30' WHERE id='166';

UPDATE beginners.comic_data SET page='30' WHERE id='167';

UPDATE beginners.comic_data SET page='28' WHERE id='168';

UPDATE beginners.comic_data SET page='26' WHERE id='169';

UPDATE beginners.comic_data SET page='20' WHERE id='170';

UPDATE beginners.comic_data SET page='20' WHERE id='171';

UPDATE beginners.comic_data SET page='30' WHERE id='172';

UPDATE beginners.comic_data SET page='16' WHERE id='173';

UPDATE beginners.comic_data SET page='16' WHERE id='174';

UPDATE beginners.comic_data SET page='16' WHERE id='175';

UPDATE beginners.comic_data SET page='16' WHERE id='176';

UPDATE beginners.comic_data SET page='30' WHERE id='177';

UPDATE beginners.comic_data SET page='30' WHERE id='178';

UPDATE beginners.comic_data SET page='31' WHERE id='179';

UPDATE beginners.comic_data SET page='31' WHERE id='180';

UPDATE beginners.comic_data SET page='18' WHERE id='181';

UPDATE beginners.comic_data SET page='18' WHERE id='182';

UPDATE beginners.comic_data SET page='16' WHERE id='183';

UPDATE beginners.comic_data SET page='16' WHERE id='184';

UPDATE beginners.comic_data SET page='46' WHERE id='185';

UPDATE beginners.comic_data SET page='20' WHERE id='186';


-- +migrate Down
alter table beginners.comic_data drop column page;