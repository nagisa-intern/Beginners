import cv2
import numpy as np

for id in range(1,18):

	id = str(id)
	img = cv2.imread("thumb_" + id + ".jpeg")
	img = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)

	h = 0
	s = 0
	v = 0

	# 全画素にアクセス
	for y in range(img.shape[0]):
		for x in range(img.shape[1]):
			h += img[y,x][0] # 0~180
			s += img[y,x][1] # 0~255
			v += img[y,x][2] # 0~255

	pixelLong = img.shape[0] * img.shape[1]
	h /= pixelLong
	s /= pixelLong
	v /= pixelLong

	print(h,s,v)

	string = ""

	if s <= 60: # 色が淡い場合、白か黒とする
		if v <= 204: # そこそこ暗い場合
			string = "黒"
		else:
			string = "白"
	elif h>=0 and h<=30:
		string = "赤"
	elif h>30 and h<=60:
		string = "黄"
	elif h>60 and h<=90:
		string = "緑"
	elif h>90 and h<=120:
		string = "水色"
	elif h>120 and h<=150:
		string = "青"
	elif h>150 and h<=180:
		string = "ピンク"

	img = cv2.cvtColor(img, cv2.COLOR_HSV2BGR)
	cv2.imshow("img", img)
	cv2.waitKey(0)
	cv2.destroyAllWindows()

	print(id + ":" + string)