#!/usr/bin/local/tarantool
--local/tarantool
--env lua5.1

box.cfg()
I = box.space.Images
if not I then
	box.schema.space.create('Images',{if_not_exists = true})
	box.space.Images:create_index('primary',
	{
		if_not_exists = true,
		type = 'hash',
		parts = {1, 'unsigned'}
	})
	for i=1,9 do
		box.space.Images:insert{i,tostring(string.format("/home/ilya/Project/img%d.ppm",i))}
	end
end
function capture1()
	os.execute("ffmpeg -i rtsp://localhost:8554/stream -y -update 1 -vf fps=1 /home/ilya/Project/img1.ppm &")
end
function capture2()
	os.execute("ffmpeg -i rtsp://localhost:8554/stream -y -update 1 -vf fps=1 /home/ilya/Project/img2.ppm &")
end
function capture3()
	os.execute("ffmpeg -i rtsp://localhost:8554/stream -y -update 1 -vf fps=1 /home/ilya/Project/img3.ppm &")
end
--[[function capture4()
	os.execute("ffmpeg -i rtsp://localhost:8554/stream -y -update 1 -vf fps=1 out4.ppm &")
end
function capture5()
	os.execute("ffmpeg -i rtsp://localhost:8554/stream -y -update 1 -vf fps=1 out5.ppm &")
end
function capture6()
	os.execute("ffmpeg -i rtsp://localhost:8554/stream -y -update 1 -vf fps=1 out6.ppm &")
end
function capture7()
	os.execute("ffmpeg -i rtsp://localhost:8554/stream -y -update 1 -vf fps=1 out7.ppm &")
end
function capture8()
	os.execute("ffmpeg -i rtsp://localhost:8554/stream -y -update 1 -vf fps=1 out8.ppm &")
end
function capture9()
	os.execute("ffmpeg -i rtsp://localhost:8554/stream -y -update 1 -vf fps=1 out9.ppm &")
end]]
cam1 = coroutine.create(capture1)
cam2 = coroutine.create(capture2)
cam3 = coroutine.create(capture3)
--[[cam4 = coroutine.create(capture4)
cam5 = coroutine.create(capture5)
cam6 = coroutine.create(capture6)
cam7 = coroutine.create(capture7)
cam8 = coroutine.create(capture8)
cam9 = coroutine.create(capture9)]]
coroutine.resume(cam1)
coroutine.resume(cam2)
coroutine.resume(cam3)
--[[coroutine.resume(cam4)
coroutine.resume(cam5)
coroutine.resume(cam6)
coroutine.resume(cam7)
coroutine.resume(cam8)
coroutine.resume(cam9)]]
print(tostring(box.space.Images:select{i}[2]))
print("End")
--i=010
--box.space.tester1:insert({2},{{'=',2,string.format('/home/ilya/Project/Screenshots/out%d.ppm',i)}})
--tbl = box.space.tester1:select{}