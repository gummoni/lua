#include "stdio.h"
#include "lua.hpp"
#include "lauxlib.h"
#include "lualib.h"

static const char* source = "print(\"Hello World\")";

void call_lua(const char* filename) {
	lua_State* L = luaL_newstate();
	luaL_loadfile(L, filename);
	lua_pushnumber(L, 1);	//引数１
	lua_pushnumber(L, 2);	//引数２

	if (lua_pcall(L, 2, 2, 0)) {	//引数2個、戻り値1個
		//エラー
		printf(lua_tostring(L, -1));
	}

	if (lua_isnumber(L, -1)) {
		int ret = lua_tointeger(L, -1); // 戻り値その 1
		printf("ret=%d\n", ret);
	}
	lua_pop(L, 1);      // 戻り値を pop

	if (lua_isnumber(L, -1)) {
		int ret = lua_tointeger(L, -1); // 戻り値その 1
		printf("ret=%d\n", ret);
	}

	lua_close(L);
}

int c_func(lua_State* L) {
	int arg1 = luaL_checkinteger(L, -2);	//第1引数
	int arg2 = luaL_checkinteger(L, -1);	//第2引数
	int ret = arg1 + arg2;
	
	lua_pushnumber(L, ret);					//戻り値1つ目をPush

	return 1;	//引数の数を返す
}

void to_bytecode(const char* filename) {
	lua_State* L = luaL_newstate();
	luaL_loadfile(L, filename);
	lua_dump(L, 0, 0, 0);
}

int main()
{
	//https://qiita.com/miuk/items/82e5566ea01313a8b1af

	//Lua開始
	lua_State* L = luaL_newstate();
	luaL_openlibs(L);

	//Lua関数登録
	lua_register(L, "c_func", c_func);

	//CからLUA実行
	call_lua("code.lua");

	//Luaコード読込み
	luaL_loadstring(L, source);
	//luaL_loadfile(L, "code.lua");

	//Lua実行
	if (0 != lua_pcall(L, 0, 0, 0)) {
		printf(lua_tostring(L, -1));
	}

	//Lua終了
	lua_close(L);
}

