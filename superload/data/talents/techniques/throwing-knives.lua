local _M = loadPrevious(...)
registerTalentTranslation{
	id = "T_THROWING_KNIVES",
	name = "飞刀投掷",
	info = function (self,t)
		local nb = t.getNb(self,t)
		local reload = t.getReload(self,t)
		local knives = knives(self)
		local weapon_damage = knives.dam
		local weapon_range = knives.dam * knives.damrange
		local weapon_atk = knives.atk
		local weapon_apr = knives.apr
		local weapon_crit = knives.physcrit
		return ([[装 备 腰 带 用 来 装 填 %d 把 飞 刀, 允 许 你 进 行 远 程 攻 击. 每 回 合 休 息 的 时 候 自 动 装 填 %d 把 飞 刀, 移 动 时 只 有 一 半 效 果.
		飞 刀 的 基 础 强 度 、 命 中 、 护 甲 穿 透 、 暴 击 几 率 随 技 能 等 级 提 升, 伤 害 根 据 匕 首 掌 握 提 升.
		投 掷 飞 刀 被 认 为 是 近 战 攻 击 命 中 目 标.
		投 掷 飞 刀 效 果 统 计:

%s]]):format(nb, reload, t.knivesInfo(self, t))
	end,
}
registerTalentTranslation{
	id = "T_FAN_OF_KNIVES",
	name = "刀扇",
	info = function (self,t)
		return ([[额 外 存 储 %d 把 飞 刀,可 以 一 次 性 扔 出 ，每 把 飞 刀 对 %d 格 锥 形 范 围 内 的 敌 人 造 成 %d%% 伤 害 .
		如 果 飞 刀 数 量 多 于 敌 人, 每 个 目 标 最 多 被 同 时 击 中 3 次. 飞 刀 无 法 穿 透 生 物.]]):
		format(t.getNb(self,t), self:getTalentRadius(t), t.getDamage(self, t)*100)
	end,
}
registerTalentTranslation{
	id = "T_PRECISE_AIM",
	name = "精确瞄准",
	info = function (self,t)
		local crit = t.getCrit(self,t)
		local power = t.getCritPower(self,t)
		local chance = t.getChance(self,t)
		return ([[精 准 地 投 掷 飞 刀, 增 加 %d%% 暴 击 几 率、 %d%% 暴 击 伤 害. 
此 外, 飞 刀 暴 击 时 还 有 %d%% 几 率 缴 械 沉 默 或 者 定 身 敌 人 持 续 2 回 合.]])
		:format(crit, power, chance)
	end,
}
registerTalentTranslation{
	id = "T_QUICKDRAW",
	name = "快速投掷",
	info = function (self,t)
		local speed = t.getSpeed(self, t)*100
		local chance = t.getChance(self, t)
		return ([[你 可 以 闪 电 般 地 投 掷 你 的 飞 刀. 增 加 %d%% 攻 击 速 度, 近 战 攻 击 时 有 %d%% 几 率 投 掷 一 把 飞 刀 随 机 对 7 格 范 围 内 的 一 名 敌 人 造 成 100%% 伤 害. 
		每 回 合 仅 触 发 1 次, 不 会 被 投 掷 飞 刀 触 发.]]):
		format(speed, chance)
	end,
}
registerTalentTranslation{
	id = "T_VENOMOUS_THROW",
	name = "剧毒飞刀",
	info = function (self,t)
		local t = self:getTalentFromId(self.T_VENOMOUS_STRIKE)
		local dam = 100 * t.getDamage(self,t)
		local desc = t.effectsDescription(self, t)
		return ([[投 掷 一 把 剧 毒 飞 刀, 造 成 %d%% 自 然 伤 害 并 根 据 你 当 前 生 效 的 毒 药 造 成 中 毒 效 果 （和 毒 素 爆 发 相 同）:
		
		%s
		使 用 这 技 能 将 使 毒 素 爆 发 进 入 冷 却.]]):
		format(dam, desc)
	end,
}
return _M