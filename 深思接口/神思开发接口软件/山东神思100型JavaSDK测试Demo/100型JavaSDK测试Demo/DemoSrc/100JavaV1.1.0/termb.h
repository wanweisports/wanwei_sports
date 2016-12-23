#define TERMB_API __declspec(dllexport)

extern TERMB_API int PASCAL InitComm(int port);
extern TERMB_API int PASCAL CloseComm();
extern TERMB_API int PASCAL Authenticate();
extern TERMB_API int PASCAL Read_Content(int active);