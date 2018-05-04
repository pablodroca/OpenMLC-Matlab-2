function [mlcpop,mlctable,i]=fill_creation(mlcpop,mlctable,mlc_parameters,indiv_to_generate,i,type,verb)
% copyright
n_indiv_to_generate=length(indiv_to_generate);
if verb>1;fprintf('Generating individual %i:',indiv_to_generate(i));end
tries = 0;
while i<=n_indiv_to_generate
    init = tic;
    mlcind=MLCind;
    mlcind.generate(mlc_parameters,type);
    [mlctable,number,already_exist]=mlctable.add_individual(mlcind);
    if ~already_exist
        preev_result = mlcind.preev(mlc_parameters);
        elapsed_ms = toc(init) * 1000;
        if  preev_result
            if verb>1;fprintf('[%d]', tries);end
            fprintf(mlc_parameters.generation_log_fileID, '%d,%d,%.2f,%s,%s\n', i, tries, elapsed_ms, 'OK', mlcind.value);
            tries = 0;
            mlcpop.individuals(indiv_to_generate(i))=number;
            i=i+1;
        else
            fprintf(mlc_parameters.generation_log_fileID, '%d,%d,%.2f,%s,%s\n', i, tries, elapsed_ms, 'NO', mlcind.value);
        end
        
    else
        elapsed_ms = toc(init) * 1000;
        fprintf(mlc_parameters.generation_log_fileID, '%d,%d,%.2f,%s,%s\n', i, tries, elapsed_ms, 'DU', mlcind.value);
        if verb>1;fprintf('X');end
    end
    tries = tries + 1;
end
if verb>1;fprintf('\n');end
        









