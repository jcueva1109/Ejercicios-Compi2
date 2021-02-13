/* treecc.h.  Generated automatically by treecc */
#ifndef __yy_treecc_h
#define __yy_treecc_h
#line 4 "/home/jcueva1109/Documents/Compi2/Ejercicios-Compi2/Mis_Recursos/Ejemplo6_TreeCC/expr.tc"
  
    //Header file
    #include <string>
#line 9 "treecc.h"

#include <new>

namespace AST
{

const int Expr_kind = 1;
const int BinaryExpr_kind = 2;
const int NumExpr_kind = 7;
const int AddExpr_kind = 3;
const int SubExpr_kind = 4;
const int MulExpr_kind = 5;
const int DivExpr_kind = 6;

class Expr;
class BinaryExpr;
class NumExpr;
class AddExpr;
class SubExpr;
class MulExpr;
class DivExpr;

class YYNODESTATE
{
public:

	YYNODESTATE();
	virtual ~YYNODESTATE();

#line 1 "cpp_skel.h"
private:

	struct YYNODESTATE_block *blocks__;
	struct YYNODESTATE_push *push_stack__;
	int used__;
#line 45 "treecc.h"
private:

	static YYNODESTATE *state__;

public:

	static YYNODESTATE *getState()
		{
			if(state__) return state__;
			state__ = new YYNODESTATE();
			return state__;
		}

public:

	void *alloc(size_t);
	void dealloc(void *, size_t);
	int push();
	void pop();
	void clear();
	virtual void failed();
	virtual const char *currFilename() const;
	virtual long currLinenum() const;

};

class Expr
{
protected:

	int kind__;
	const char *filename__;
	long linenum__;

public:

	int getKind() const { return kind__; }
	const char *getFilename() const { return filename__; }
	long getLinenum() const { return linenum__; }
	void setFilename(const char *filename) { filename__ = filename; }
	void setLinenum(long linenum) { linenum__ = linenum; }

	void *operator new(size_t);
	void operator delete(void *, size_t);

protected:

	Expr();

public:


	virtual int isA(int kind) const;
	virtual const char *getKindName() const;

protected:

	virtual ~Expr();

};

class BinaryExpr : public Expr
{
protected:

	BinaryExpr(Expr * expr1, Expr * expr2);

public:

	Expr * expr1;
	Expr * expr2;


	virtual int isA(int kind) const;
	virtual const char *getKindName() const;

protected:

	virtual ~BinaryExpr();

};

class NumExpr : public Expr
{
public:

	NumExpr(double val);

public:

	double val;


	virtual int isA(int kind) const;
	virtual const char *getKindName() const;

protected:

	virtual ~NumExpr();

};

class AddExpr : public BinaryExpr
{
public:

	AddExpr(Expr * expr1, Expr * expr2);

public:


	virtual int isA(int kind) const;
	virtual const char *getKindName() const;

protected:

	virtual ~AddExpr();

};

class SubExpr : public BinaryExpr
{
public:

	SubExpr(Expr * expr1, Expr * expr2);

public:


	virtual int isA(int kind) const;
	virtual const char *getKindName() const;

protected:

	virtual ~SubExpr();

};

class MulExpr : public BinaryExpr
{
public:

	MulExpr(Expr * expr1, Expr * expr2);

public:


	virtual int isA(int kind) const;
	virtual const char *getKindName() const;

protected:

	virtual ~MulExpr();

};

class DivExpr : public BinaryExpr
{
public:

	DivExpr(Expr * expr1, Expr * expr2);

public:


	virtual int isA(int kind) const;
	virtual const char *getKindName() const;

protected:

	virtual ~DivExpr();

};


double eval(Expr * e);

}
#endif
