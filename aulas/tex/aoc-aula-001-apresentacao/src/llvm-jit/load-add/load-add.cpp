#include <llvm/IR/LLVMContext.h>
#include <llvm/Bitcode/ReaderWriter.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/MemoryBuffer.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/ExecutionEngine/ExecutionEngine.h>
#include <llvm/ExecutionEngine/JIT.h>
#include <llvm/Support/system_error.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/TargetSelect.h>
#include <llvm/ExecutionEngine/RuntimeDyld.h>
#include <iostream>
#include <fstream>
#include <string>

using namespace std;
using namespace llvm;
/* Algumas declara��es foram suprimidas. */
int main() {
  /* Inicializa��es do LLVM. */
  InitializeNativeTarget();

  LLVMContext context;
  SMDiagnostic error;

  /* Leitura do arquivo. */
  std::ifstream ir_file("add.ll");
  std::string ir((std::istreambuf_iterator<char>(ir_file)), (std::istreambuf_iterator<char>()));

  /* Carregamento do M�dulo. */
  Module *m = ParseIR(MemoryBuffer::getMemBuffer(StringRef(ir)), error, context);

  if(!m){
    cout << "Problema na varredura do arquivo." << endl;
  }

  /* Cria��o do JIT. */
  ExecutionEngine *JIT = ExecutionEngine::create(m);
  JIT->DisableLazyCompilation();

  /* Recupera��o da fun��o. */
  Function *function = JIT->FindFunctionNamed("_Z3addff");

  if(!function){
    cerr << "Fun��o n�o encontrada." << endl;
    exit(-1);
  }

  typedef float (*fcn_ptr)(float, float);
  fcn_ptr funcAdd = reinterpret_cast<fcn_ptr>(JIT->getPointerToFunction(function));
  float result = funcAdd(3,6);
  cout << "Result: "<< result << endl;
  delete JIT;

  return 0;
}
