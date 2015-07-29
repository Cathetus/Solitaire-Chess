math.randomseed(os.time())

function love.load()--loading the images and setting up the board
	love.window.setMode(360,360)

	ls = love.graphics.newImage("light_square.png")
	ds = love.graphics.newImage("dark_square.png")
	
	p = love.graphics.newImage("pawn.png")
	n = love.graphics.newImage("knight.png")
	b = love.graphics.newImage("bishop.png")
	r = love.graphics.newImage("rook.png")
	q = love.graphics.newImage("queen.png")
	k = love.graphics.newImage("king.png")
	
	board = {}
	tiles = {ls,ds,ls,ds,ls,ds,ls,ds,ls,ds,ls,ds,ls,ds,ls,ds}
	pieces = {0,p,n,b,r,q,k}
	
	for i = 1, #tiles do
		x = math.random(1,#pieces)
		board[i] = pieces[x]
	end
end

function love.keypressed(key, isrepeat)--reset the board
	if key == " " then
		for i = 1, #tiles do
			x = math.random(1,#pieces)
			board[i] = pieces[x]
		end
	end
end

function love.draw()--drawing the board
	for i = 1, 4 do
		for j = 1, 4 do
			love.graphics.draw(tiles[i+j-1], i*90-90, j*90-90)
			if board[i+j-1] ~= 0 then
				love.graphics.draw(board[i+j-1], i*90-90, j*90-90)
			end
		end
	end
end
