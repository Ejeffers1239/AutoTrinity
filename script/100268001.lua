function c100268001.initial_effect(c)

c:EnableReviveLimit()

--special summon rule

	local e1=Effect.CreateEffect(c)

	e1:SetType(EFFECT_TYPE_FIELD)

	e1:SetProperty(EFFECT_FLAG_UNCOPYABLE+EFFECT_FLAG_CANNOT_DISABLE)

	e1:SetCode(EFFECT_SPSUMMON_PROC)

	e1:SetRange(LOCATION_HAND)

	e1:SetCondition(c100268001.hspcon)

	e1:SetOperation(c100268001.hspop)

	c:RegisterEffect(e1)
	
	end
	
	function c100268001.hspfilter(c,tp)

	return c:IsType(TYPE_TOON) and Duel.GetMZoneCount(tp,c)>0

end

function c100268001.hspcon(e,c)

	if c==nil then return true end

	local tp=c:GetControler()

	return Duel.CheckReleaseGroupEx(tp,c100268001.hspfilter,1,c,tp)

end

function c100268001.hspop(e,tp,eg,ep,ev,re,r,rp,c)

	local sg=Duel.SelectReleaseGroupEx(tp,c100268001.hspfilter,1,8,c,tp)
	
	local sga=sg:SelectWithSumGreater(tp,Card.GetLevel,8)

	Duel.Release(sga,REASON_COST)

end
